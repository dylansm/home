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

# prompt stuff
prompt_icon="%(?.%{$fg[green]%}✚ %{$reset_color%}.%{$fg[red]%}✚ %{$reset_color%})"

PROMPT='
%~
${prompt_icon} %{$reset_color%}'

# nvm, pyenv, rbenv
#RPROMPT='%{$fg[red]%}node-$(nvm_ls 'current') %{$fg[green]%}py-$(python_version) %{$fg[magenta]%}ruby-$(ruby_version)$(~/bin/git_cwd_info.rb)%{$reset_color%}'

# nvm, pyenv
#RPROMPT='%{$fg[red]%}node-$(nvm_ls 'current') %{$fg[green]%}py-$(pyenv version-name)$(~/bin/git_cwd_info.rb)%{$reset_color%}'

# nvm, python venv
# node outer: replace 'v' with nothing
# python outer: replace space with '-', next: lowercase
RPROMPT='%{$fg[red]%}node-${${$(nvm 'current')}//v/} %{$fg[green]%}${${$(python3 --version):l}// /-}$(~/bin/git_cwd_info.rb)%{$reset_color%}'

# jenv, nvm
# javaversion=$(jenv version)
# javaversion=${javaversion%%[[:space:]]*}
#RPROMPT='$(~/bin/git_cwd_info.rb)%{$reset_color%}'

# uncomment if going back to pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/dylan/.lmstudio/bin"
# End of LM Studio CLI section

