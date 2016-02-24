# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */usr/local/opt/fzf/man* && -d "/usr/local/opt/fzf/man" ]]; then
  export MANPATH="$MANPATH:/usr/local/opt/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Utilities
# ------------

# fd - fuzzy cd (includes hidden directories)
fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fuzzy kill processes
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

fuzzy_notes() {
  cd ~/Dropbox/Documents/Notes;
  vim "$(fzf)"
}
