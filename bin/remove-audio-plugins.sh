#!/bin/bash
#
# remove-audio-plugins.sh
#
# Permanently remove macOS audio plugins listed in a file (one path per line),
# after a dry-run preview and a single confirmation.
#
# Usage:
#   remove-audio-plugins.sh <plugin-list-file>
#
# Safety:
#   - Requires root; re-executes itself via sudo if not already root.
#   - Only deletes items STRICTLY UNDER a known plugin root. The root
#     directories themselves (and anything above them) can never be deleted.
#   - Validates every entry and shows a full preview before deleting anything.
#
# Input file format:
#   - One path per line.
#   - Blank lines and lines beginning with '#' are ignored.
#   - Surrounding whitespace is trimmed.
#   - A leading '~' is expanded to the invoking user's home directory.

set -u

PROG="$(basename "$0")"

usage() {
    echo "Usage: $PROG <plugin-list-file>" >&2
    exit 2
}

[ "$#" -eq 1 ] || usage
LIST_FILE="$1"

# --- Re-exec as root if needed -------------------------------------------------
# Resolve the list file to an absolute path BEFORE re-exec, so the path is still
# valid regardless of sudo's working directory.
if [ "${EUID:-$(id -u)}" -ne 0 ]; then
    case "$LIST_FILE" in
        /*) ABS_LIST="$LIST_FILE" ;;
        *)  ABS_LIST="$PWD/$LIST_FILE" ;;
    esac
    echo "Root privileges are required; re-running with sudo..."
    exec sudo "$0" "$ABS_LIST"
fi

[ -f "$LIST_FILE" ] || { echo "$PROG: cannot read list file: $LIST_FILE" >&2; exit 1; }
[ -r "$LIST_FILE" ] || { echo "$PROG: list file is not readable: $LIST_FILE" >&2; exit 1; }

# --- Determine the invoking user's home (not root's) ---------------------------
if [ -n "${SUDO_USER:-}" ] && [ "$SUDO_USER" != "root" ]; then
    USER_HOME="$(dscl . -read "/Users/$SUDO_USER" NFSHomeDirectory 2>/dev/null | awk '{print $2}')"
    [ -n "$USER_HOME" ] || USER_HOME="$(eval echo "~$SUDO_USER")"
else
    USER_HOME="$HOME"
fi

# --- Allowed plugin roots ------------------------------------------------------
# Items must live STRICTLY UNDER one of these; the roots themselves are never
# removable.
ROOTS=(
    "/Library/Audio/Plug-Ins/Components"
    "/Library/Audio/Plug-Ins/VST"
    "/Library/Audio/Plug-Ins/VST3"
    "/Library/Application Support/Avid/Audio/Plug-Ins"
    "$USER_HOME/Library/Audio/Plug-Ins/Components"
    "$USER_HOME/Library/Audio/Plug-Ins/VST"
    "$USER_HOME/Library/Audio/Plug-Ins/VST3"
)

# --- Helpers -------------------------------------------------------------------

# Trim leading/trailing whitespace.
trim() {
    local s="$1"
    s="${s#"${s%%[![:space:]]*}"}"
    s="${s%"${s##*[![:space:]]}"}"
    printf '%s' "$s"
}

# Lexically normalise a path: expand a leading '~', make absolute relative to the
# invoking directory, and resolve '.'/'..' WITHOUT following symlinks. This stops
# a crafted entry from escaping the whitelist via '../../..'.
normalize_path() {
    local input="$1"

    if [ "$input" = "~" ]; then
        input="$USER_HOME"
    else
        case "$input" in
            "~/"*) input="$USER_HOME/${input#\~/}" ;;
        esac
    fi

    case "$input" in
        /*) ;;
        *) input="$PWD/$input" ;;
    esac

    local IFS='/'
    local -a parts=()
    read -ra parts <<< "$input"

    local -a stack=()
    local n=0 part
    for part in "${parts[@]}"; do
        case "$part" in
            ''|'.') ;;
            '..')
                if [ "$n" -gt 0 ]; then
                    n=$((n - 1))
                    unset "stack[$n]"
                fi
                ;;
            *)
                stack[$n]="$part"
                n=$((n + 1))
                ;;
        esac
    done

    local out="" i
    for ((i = 0; i < n; i++)); do
        out="$out/${stack[$i]}"
    done
    [ -n "$out" ] || out="/"
    printf '%s' "$out"
}

# Is the (already normalised) path strictly under an allowed root?
is_under_root() {
    local p="$1" root
    for root in "${ROOTS[@]}"; do
        case "$p" in
            "$root"/?*) return 0 ;;
        esac
    done
    return 1
}

# Human label for what a path is on disk. Order matters: test symlink first so a
# symlink to a directory is reported as a symlink, not a bundle.
path_kind() {
    local p="$1"
    if [ -L "$p" ]; then
        printf 'symlink'
    elif [ -d "$p" ]; then
        printf 'bundle/dir'
    elif [ -f "$p" ]; then
        printf 'file'
    else
        printf 'other'
    fi
}

# --- Classify every entry ------------------------------------------------------
TO_DELETE=()        # "path|kind" — under a root and exists
TO_DELETE_LABEL=()
NOT_FOUND=()        # under a root but does not exist
REJECTED=()         # not under any root (or is a root / above one)

line_no=0
while IFS= read -r raw || [ -n "$raw" ]; do
    line_no=$((line_no + 1))
    line="$(trim "$raw")"
    [ -n "$line" ] || continue
    case "$line" in
        \#*) continue ;;
    esac

    norm="$(normalize_path "$line")"

    if ! is_under_root "$norm"; then
        REJECTED+=("$norm")
        continue
    fi

    # -e misses broken symlinks; -L catches them.
    if [ -e "$norm" ] || [ -L "$norm" ]; then
        TO_DELETE+=("$norm")
        TO_DELETE_LABEL+=("$(path_kind "$norm")")
    else
        NOT_FOUND+=("$norm")
    fi
done < "$LIST_FILE"

# --- Dry-run report ------------------------------------------------------------
echo
echo "=== Audio plugin removal — preview ==="
echo "List file: $LIST_FILE"
echo

if [ "${#TO_DELETE[@]}" -gt 0 ]; then
    echo "Will delete (${#TO_DELETE[@]}):"
    i=0
    for p in "${TO_DELETE[@]}"; do
        printf '  [%s] %s\n' "${TO_DELETE_LABEL[$i]}" "$p"
        i=$((i + 1))
    done
    echo
fi

if [ "${#NOT_FOUND[@]}" -gt 0 ]; then
    echo "Skipped — not found on disk (${#NOT_FOUND[@]}):"
    for p in "${NOT_FOUND[@]}"; do
        printf '  %s\n' "$p"
    done
    echo
fi

if [ "${#REJECTED[@]}" -gt 0 ]; then
    echo "Rejected — outside allowed plugin roots (${#REJECTED[@]}):"
    for p in "${REJECTED[@]}"; do
        printf '  %s\n' "$p"
    done
    echo
fi

# --- Confirm and delete --------------------------------------------------------
if [ "${#TO_DELETE[@]}" -eq 0 ]; then
    echo "Nothing to delete."
    exit 0
fi

printf 'Delete %d item(s) permanently? [y/N] ' "${#TO_DELETE[@]}"
read -r reply
case "$reply" in
    y|Y|yes|YES|Yes) ;;
    *) echo "Aborted. Nothing was deleted."; exit 0 ;;
esac

echo
failures=0
for p in "${TO_DELETE[@]}"; do
    if rm -rf -- "$p"; then
        echo "Removed: $p"
    else
        echo "FAILED:  $p" >&2
        failures=$((failures + 1))
    fi
done

echo
if [ "$failures" -gt 0 ]; then
    echo "Done with $failures failure(s)." >&2
    exit 1
fi
echo "Done. Removed ${#TO_DELETE[@]} item(s)."
exit 0
