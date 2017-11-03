if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export JENV_ROOT=/usr/local/var/jenv
export PYENV_ROOT="$HOME/.pyenv"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# export MPD_HOST="bird.local"
# export MPD_HOST="monk.local"
export MPD_HOST="birdh"
# export MPD_HOST="localhost"

export FZF_DEFAULT_COMMAND='ag -g ""'
export EDITOR="nvim"
export LC_CTYPE=en_US.UTF-8
export PATH="$HOME/.rbenv/bin:$PATH"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NODE_PATH=/usr/local/lib/node_modules
export SCALA_HOME=/usr/local/scala
export TIDY_HTML=~/.tidyrc
export XCODE="`xcode-select --print-path`"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/Library/Python/2.7/bin:$PATH"
# export GOPATH="$HOME/dev/go/bin"
# export PATH="$PATH:$GOPATH/bin"
export KEYTIMEOUT=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export PIP_CONFIG_FILE="$HOME/.config/pip/pip.conf"

# export PATH="$HOME/dev/android/tools/bin:$HOME/dev/android/platforms/android-22:$PATH"
export THE_DRAW_DEPLOY_USER="dylan_smith"

# export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

HISTFILE=~/.zshrc.d/.zsh_history
HISTSIZE=1024
SAVEHIST=1024

if [[ -f ~/.config/api_secrets.yml ]]; then
  . ~/.zshrc.d/parse_yaml.zsh
  eval $(parse_yaml ~/.config/api_secrets.yml)
  # export AWS_ACCESS_KEY_ID=`echo $default_aws_access_key_id`
  # export AWS_SECRET_ACCESS_KEY=`echo $default_aws_secret_access_key`
  export AWS_ACCESS_KEY_ID=`echo $the_draw_aws_access_key`
  export AWS_SECRET_ACCESS_KEY=`echo $the_draw_aws_secret_access_key`
  # export AWS_ACCESS_KEY_ID=`echo $the_program_aws_access_key_id`
  # export AWS_SECRET_ACCESS_KEY=`echo $the_program_aws_secret_access_key`
  export DIGITALOCEAN_ACCESS_TOKEN=`echo $the_program_digitalocean_access_token`
  # export DIGITALOCEAN_ACCESS_TOKEN=`echo $default_digitalocean_access_token`
  # export DIGITALOCEAN_ACCESS_TOKEN=`echo $suspect_digitalocean_access_token`
  export GITHUB_AUTH_TOKEN=`echo $default_github_auth_token`
  export HOMEBREW_GITHUB_API_TOKEN=`echo $default_github_homebrew_token`
  export IWANTMYNAME_PASSWORD=`echo $default_iwantmyname_password`
  export IWANTMYNAME_USERNAME=`echo $default_iwantmyname_username`
  export NPM_TOKEN=`echo $default_npm_token`
  export PINBOARD_API_KEY=`echo $default_pinboard_api_key`
fi

if [[ -f ~/.config/app_secrets.yml ]]; then
  . ~/.zshrc.d/parse_yaml.zsh
  eval $(parse_yaml ~/.config/app_secrets.yml)

  export AUTH_TEST_JWT_DEVELOPMENT=`echo $auth_test_development_jwt_secret`
  export CALDUX_JWT_DEVELOPMENT=`echo $caldux_development_jwt_secret`
  export NIKE_LOCKER_JWT_DEVELOPMENT=`echo $nike_locker_development_jwt_secret`
  export MONGO_CONNECTION=`echo $clojure_test_development_mongo_conn`
fi
