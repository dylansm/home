# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dylan/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/dylan/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/dylan/.fzf/man* && -d "/Users/dylan/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/dylan/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dylan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/dylan/.fzf/shell/key-bindings.zsh"

