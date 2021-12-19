ssh-add -A &> /dev/null

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
bindkey '^l' forward-word                     # ctrl-l
bindkey '^h' backward-word                    # ctrl-h
# bindkey '^h' backward-char
# bindkey '^l' forward-char
bindkey "^[[A" up-line-or-beginning-search    # ctrl-a
bindkey "^[[B" down-line-or-beginning-search  # ctrl-b
bindkey "^p" up-line-or-beginning-search      # ctrl-p
bindkey "^n" down-line-or-beginning-search    # ctrl-n
bindkey -s '^g' '^Ugit status -s^M'           # ctrl-g
bindkey -s '^f' '^Uff^M'                      # ctrl-f

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'   # case insensitive completion for cd etc *N*
# zstyle ':completion:*:*:git:*' script ~/bin/.git-completion.sh

[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# jenv start
eval export PATH="/Users/dylan/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/opt/homebrew/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}
# jenv end

# prompt stuff
prompt_icon="%(?.%{$fg[green]%}✚ %{$reset_color%}.%{$fg[red]%}✚ %{$reset_color%})"

PROMPT='
%~
${prompt_icon} %{$reset_color%}'

# nvm, pyenv, rbenv
#RPROMPT='%{$fg[red]%}node-$(nvm_ls 'current') %{$fg[green]%}py-$(python_version) %{$fg[magenta]%}ruby-$(ruby_version)$(~/bin/git_cwd_info.rb)%{$reset_color%}'
# jenv, nvm, pyenv, rbenv
javaversion=$(jenv version)
javaversion=${javaversion%%[[:space:]]*}
# echo $javaversion
RPROMPT='%{$fg[green]%}java-$javaversion %{$fg[red]%}node-$(nvm_ls 'current') %{$fg[green]%}py-$(python_version) %{$fg[magenta]%}ruby-$(ruby_version)$(~/bin/git_cwd_info.rb)%{$reset_color%}'
