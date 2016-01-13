if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export JENV_ROOT=/usr/local/var/jenv
export PYENV_ROOT=/usr/local/var/pyenv
export NVM_DIR=~/.nvm
export FZF_DEFAULT_COMMAND='ag -g ""'
eval $(docker-machine env default)
export EDITOR="nvim"
export PATH="$HOME/.rbenv/bin:$PATH"
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NODE_PATH=/usr/local/lib/node_modules
export SCALA_HOME=/usr/local/scala
export XCODE="`xcode-select --print-path`"
export PATH="/usr/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/opt/mysql56/bin/:${SCALA_HOME}/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export KEYTIMEOUT=1
HISTFILE=~/.zshrc.d/.zsh_history
HISTSIZE=1024
SAVEHIST=1024

if [[ -f ~/.api_secrets.yml ]]; then
  export GITHUB_AUTH_TOKEN=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['github_auth_token']"`
  export AWS_ACCESS_KEY_ID=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['aws_access_key_id']"`
  export AWS_SECRET_ACCESS_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['aws_secret_access_key']"`
  export NPM_TOKEN=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['npm_token']"`
  export PINBOARD_API_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['pinboard_api_key']"`
fi

if [[ -f ~/.app_secrets.yml ]]; then
  export THE_DRAW_DEPLOY_USER=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['thedraw']['defaults']['deploy_user']"`
fi
