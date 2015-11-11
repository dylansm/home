source ~/.gvm/scripts/gvm
source $(brew --prefix nvm)/nvm.sh

if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*.zsh; do
    source $file
  done
fi

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U colors \
  compinit \
  promptinit \
  up-line-or-beginning-search \
  down-line-or-beginning-search

colors
compinit
promptinit

setopt promptsubst
setopt autocd
setopt nocaseglob  # set ignore case for ls etc
setopt autopushd
setopt always_to_end
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'   # case insensitive completion for cd etc *N*
zstyle ':completion:*:*:git:*' script ~/bin/.git-completion.sh


[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# show full history from line 1 or grep for something
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

# Open argument in Dash
function dash() {
  open "dash://$*"
}

# Save a smiley to a local variable if the last command exited with success.
local smiley="%(?,%{$fg[green]%}☀︎ %{$reset_color%},%{$fg[red]%}☁︎ %{$reset_color%})"
# set tmux colors on error
if [ "$TMUX" ]; then
  PROMPT='$(if [[ $? == '0' ]]; then $(tmux set status-left-bg "black"); else $(tmux set status-left-bg "red"); fi)
%~
${smiley} %{$reset_color%}'
else
  PROMPT='
%~
${smiley} %{$reset_color%}'
fi

RPROMPT='%{$fg[red]%}node-$(nvm_ls 'current')%{$fg[cyan]%} $(~/.gvm/bin/gvm-prompt)%{$reset_color%}%{$fg[green]%} py-$(pyenv global)%{$fg[magenta]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git_cwd_info.rb)%{$reset_color%}'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
