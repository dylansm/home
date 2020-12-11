ssh-add -A &> /dev/null

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*.zsh; do
    source $file
  done
fi

# Check if docker is running
docker_state=$(docker info >/dev/null 2>&1)
if [[ $? -eq 0 ]]; then
    for file in $HOME/.zshrc.d/docker_aliases/*.zsh; do
      source $file
    done
fi

autoload -Uz \
  up-line-or-beginning-search \
  down-line-or-beginning-search
autoload -Uz colors && colors -i
autoload -Uz compinit && compinit -i
autoload -Uz promptinit && promptinit -i
autoload -Uz zmv

fpath=(~/.zshrc.d/completions $fpath)

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
# bindkey '^[[1;9C' forward-word
# bindkey '^[[1;9D' backward-word
# bindkey '˙' backward-word
# bindkey '¬' forward-word
bindkey '^l' forward-word
bindkey '^h' backward-word
# bindkey '^h' backward-char
# bindkey '^l' forward-char
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search
bindkey -s '^g' '^Ugit status -s^M'
bindkey -s '^f' '^Uff^M'

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'   # case insensitive completion for cd etc *N*
# zstyle ':completion:*:*:git:*' script ~/bin/.git-completion.sh

[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# prompt stuff
prompt_icon="%(?.%{$fg[green]%}✚ %{$reset_color%}.%{$fg[red]%}✚ %{$reset_color%})"
# set tmux colors on error
# if [ "$TMUX" ]; then
  # PROMPT='$(if [[ $? == '0' ]]; then $(tmux set status-left-bg "black"); else $(tmux set status-left-bg "red"); fi)
# %~
# ${prompt_icon} %{$reset_color%}'
# else
  # PROMPT='
# %~
# ${prompt_icon} %{$reset_color%}'
# fi
PROMPT='
%~
${prompt_icon} %{$reset_color%}'

# nvm, pyenv, jenv, ruby
# RPROMPT='%{$fg[red]%}node-$(nvm_ls 'current') %{$fg[green]%}py-$(python_version) %{$fg[grey]%}java-$(jenv version-name) %{$fg[magenta]%}ruby-$(ruby_version)$(~/bin/git_cwd_info.rb)%{$reset_color%}'
# nvm, pyenv, rbenv
# RPROMPT='%{$fg[red]%}node-$(nvm_ls 'current') %{$fg[green]%}py-$(python_version) %{$fg[magenta]%}ruby-$(ruby_version)$(~/bin/git_cwd_info.rb)%{$reset_color%}'
