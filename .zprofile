export FZF_DEFAULT_COMMAND='ag -g ""'
export EDITOR="nvim"
export LC_CTYPE=en_US.UTF-8
#export PATH="$HOME/.rbenv/bin:$PATH"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export TIDY_HTML=~/.tidyrc
export XCODE="`xcode-select --print-path`"
# export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/Library/Python/2.7/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
#export RUBY_CONFIGURE_OPTS="--disable-install-doc"
# export PATH="$HOME/.fastlane/bin:$PATH"

export KEYTIMEOUT=1
export PIP_CONFIG_FILE="$HOME/.config/pip/pip.conf"

HISTFILE=~/.zshrc.d/.zsh_history
HISTSIZE=1024
SAVEHIST=1024

local claude_mode_file="$HOME/.env_claude_payment_mode"
# if no .env_claude_payment_mode file create it defaulting to plan
[[ ! -f "$claude_mode_file" ]]; echo "plan" > "$claude_mode_file"
CLAUDE_MODE=$(cat "$claude_mode_file")

toggle_claude() {

  if [[ "$#" -ne 1 ]]; then
    echo "Error: Invalid number of arguments."
    echo "Usage: toggle_claude <mode>"
    echo "  <mode> can be 'api', 'plan', or 'local'."
    return
  fi

  local mode="$1"
  case "$mode" in
    "api")
      # Conditional execution for 'api' mode
      PAYMENT_TYPE="api"
      ;;
    "plan")
      # Conditional execution for 'plan' mode
      PAYMENT_TYPE="plan"
      ;;
    "local")
      # Conditional execution for 'local' mode
      PAYMENT_TYPE="local"
      ;;
    *)
      echo "Error: Invalid mode '$mode'."
      echo "Usage: toggle_claude <mode>"
      echo "  <mode> can be 'api', 'plan', or 'local'."
      return
      ;;
  esac

  echo "${PAYMENT_TYPE}" > "${claude_mode_file}"

  echo "Now using Claude ${PAYMENT_TYPE} mode."
  CLAUDE_MODE=`echo ${PAYMENT_TYPE}`
  fetch_secrets
}

fetch_secrets() {
  # relies on dependency ~/.zshrc.d/parse_yaml.zsh (see API Keys and Secrets management note)
  if [[ -f ~/.config/api_secrets.yml ]]; then
    . ~/.zshrc.d/parse_yaml.zsh
    eval $(parse_yaml ~/.config/api_secrets.yml)

    case "${CLAUDE_MODE}" in
      "api")
        # Conditional execution for 'api' mode
        unset CLAUDE_CODE_OAUTH_TOKEN
        unset ANTHROPIC_BASE_URL
        export ANTHROPIC_API_KEY=`echo $default_anthropic_api_key`
        ;;
      "plan")
        # Conditional execution for 'plan' mode
        unset ANTHROPIC_API_KEY
        unset ANTHROPIC_BASE_URL
        export CLAUDE_CODE_OAUTH_TOKEN=`echo $default_claude_code_oauth_token`
        ;;
      "local")
        # Conditional execution for 'local' mode
        unset CLAUDE_CODE_OAUTH_TOKEN
        export ANTHROPIC_BASE_URL=http://localhost:3456
        export ANTHROPIC_API_KEY=sk-ant-dummy
        ;;
      *)
        echo "Error: Invalid mode '$mode'."
        echo "  <mode> can be 'api', 'plan', or 'local'."
        return
        ;;
    esac

    export GEMINI_API_KEY=`echo $default_gemini_api_key`
    #export ANTHROPIC_API_KEY=`echo $default_anthropic_api_key`
    #export AWS_ACCESS_KEY_ID=`echo $default_aws_access_key_id`
    #export AWS_SECRET_ACCESS_KEY=`echo $default_aws_secret_access_key`
  fi

  if [[ -f ~/.config/app_secrets.yml ]]; then
    . ~/.zshrc.d/parse_yaml.zsh
    eval $(parse_yaml ~/.config/app_secrets.yml)

    #export AUTH_TEST_JWT_DEVELOPMENT=`echo $auth_test_development_jwt_secret`
    #export CALDUX_JWT_DEVELOPMENT=`echo $caldux_development_jwt_secret`
    #export NIKE_LOCKER_JWT_DEVELOPMENT=`echo $nike_locker_development_jwt_secret`
    #export MONGO_CONNECTION=`echo $clojure_test_development_mongo_conn`
  fi
}

fetch_secrets

export NVM_DIR="$HOME/.nvm"

ARCH=`uname -a`
ARM64="ARM64"

if [[ "$ARCH" =~ "$ARM64" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)

  # nvm init
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

else
  # Intel
  # nvm init
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

fi

