if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export JENV_ROOT=/usr/local/var/jenv
export PYENV_ROOT=/usr/local/var/pyenv
export NVM_DIR=~/.nvm

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# if which docker-machine > /dev/null; then
  # eval $(docker-machine env default)
# fi

# export MPD_HOST="monk.local"
export MPD_HOST="localhost"
export FZF_DEFAULT_COMMAND='ag -g ""'
export EDITOR="nvim"
export LC_CTYPE=en_US.UTF-8
export PATH="$HOME/.rbenv/bin:$PATH"
if [[ $(uname) == "Darwin" ]]; then
  export TERM=screen-256color-italic
fi
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NODE_PATH=/usr/local/lib/node_modules
export SCALA_HOME=/usr/local/scala
export TIDY_HTML=~/.tidyrc
export XCODE="`xcode-select --print-path`"
export PATH="/usr/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/opt/mysql56/bin:${SCALA_HOME}/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export KEYTIMEOUT=1

HISTFILE=~/.zshrc.d/.zsh_history
HISTSIZE=1024
SAVEHIST=1024

if [[ -f ~/.config/api_secrets.yml ]]; then
  . ~/.zshrc.d/parse_yaml.zsh
  eval $(parse_yaml ~/.config/api_secrets.yml)

  export HOMEBREW_GITHUB_API_TOKEN=`echo $default_github_homebrew_token`
  export GITHUB_AUTH_TOKEN=`echo $default_github_auth_token`
  export AWS_ACCESS_KEY_ID=`echo $default_aws_access_key_id`
  export AWS_SECRET_ACCESS_KEY=`echo $default_aws_secret_access_key`
  export NPM_TOKEN=`echo $default_npm_token`
  export PINBOARD_API_KEY=`echo $default_pinboard_api_key`
  export IWANTMYNAME_USERNAME=`echo $default_iwantmyname_username`
  export IWANTMYNAME_PASSWORD=`echo $default_iwantmyname_password`
fi

if [[ -f ~/.config/app_secrets.yml ]]; then
  . ~/.zshrc.d/parse_yaml.zsh
  eval $(parse_yaml ~/.config/app_secrets.yml)

  export AUTH_TEST_JWT_DEVELOPMENT=`echo $auth_test_development_jwt_secret`
  export CALDUX_JWT_DEVELOPMENT=`echo $caldux_development_jwt_secret`
  export NIKE_LOCKER_JWT_DEVELOPMENT=`echo $nike_locker_development_jwt_secret`
fi
