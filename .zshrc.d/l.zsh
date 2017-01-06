function l {

  if [[ $# -eq 1 ]]; then
    export target="$1"
  else
    export target="$(pwd)"
  fi

  ls -Alp "$target" | awk '
    function details(color) {
      printf(ENVIRON[color]"%-13s%5s   %8s • %-6s  %8s    %s %2s", $1, $2, $3, $4, $5, $6, $7)
    }

    function filename(color, dotfile) {
      $1=$2=$3=$4=$5=$6=$7=$8=""
      {
        gsub (/^ +/, "", $0)
        if (dotfile == 1) {
          printf(ENVIRON["Italic"]ENVIRON[color]"   %s\n"ENVIRON["Plain"], $0)
        } else {
          printf(ENVIRON[color]"    %s\n"ENVIRON["Plain"], $0)
        }
      }
    }

  # dotfiles
  $9 ~ /^\.([[:print:]]+ ?)+$/ && $1 ~ /^-/ {
    details("Bone")
    filename("BrightBone", 1)
  }

  # dotfile directories
  $9 ~ /^\.([[:print:]]+ ?)+$/ && $1 ~ /^d/ {
    details("Green")
    filename("BrightGreen", 1)
  }

  # regular directories
  $9 ~ /^[^.]([[:print:]]+ ?)+$/ && $1 ~ /^d/ {
    if ($1 ~ /^d(rwx){3}/) {
      details("Yellow")
      filename("BrightYellow")
    }
    else {
      details("Magenta")
      filename("BrightMagenta")
    }
  }

  # regular files
  $9 ~ /^[^.]([[:print:]]+ ?)*$/ {
    if ($1 ~ /^-(rwx){3}/) {
      details("Yellow")
      filename("BrightYellow")
    }
    else if ($1 ~ /^-([rw-]{2}x){3}/) {
      details("Red")
      filename("BrightRed")
    }
    else {
      details("Blue")
      filename("BrightBlue")
    }
  }'
}
