# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
else
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin/fzf/bin"
fi

# Auto-completion
# ---------------
if [[ "$ARCH" =~ "$ARM64" ]]; then
  [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null
else
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
fi

# Key bindings
# ------------

if [[ "$ARCH" =~ "$ARM64" ]]; then
  source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
else
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi


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

ff() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}
