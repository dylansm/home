alias ...='cd ../../'
alias ..='cd ../'
alias ani='ansible'
alias anip='ansible-playbook'
alias awscomp="source /usr/local/bin/aws_zsh_completer.sh"
alias be='bundle exec'
alias bfg="java -jar ~/bin/bfg-1.12.6.jar"
alias bin='if [ -d ./bin ]; then cd bin; else cd ~/bin; fi'
alias brake='bundle exec rake'
alias brewi='brew install'
alias brewup="brew update && brew cleanup"
alias bundled="echo '\nInstalling gems for development and test only...\n'; bundle install --without production staging"
alias calias="cat ~/.zshrc.d/aliases.zsh"
alias caski="brew cask install --appdir=/Applications --colorpickerdir=~/Library/ColorPickers"
alias clearlog="sudo cat /dev/null > "
alias cloj='cd /Users/Shared/Development/Clojure'
alias code='cd /Users/Shared/Development/Code_Library'
alias ctag='ctags -R --exclude=.git --exclude=log --exclude=tmp *'
alias cuc='cucumber'
alias curlh='curl -IL '
alias d='cd ~/Desktop'
alias dev='cd /Users/Shared/Development'
alias dk='docker'
alias dkc='docker-compose'
alias dkinf='docker info'
alias dkk='docker kill'
alias dkl='docker logs -f'
alias dkr='docker-machine regenerate-certs default'
alias dks='docker stop $(docker ps -q)'
alias dku='docker-compose up -d'
alias dm='docker-machine'
alias dmip='docker-machine ip default'
alias dmipc='docker-machine ip default | pbcopy'
alias doc='cd ~/Dropbox/Documents'
alias dock='cd /Users/Shared/Development/Docker'
alias gitf='git fetch'
alias gitm='git merge'
alias gitu='git add -u'
alias gitv="git remote -v"
alias gr='cd /Users/Shared/Development/GitRepos'
alias history='history 0'
alias ipc="curl ifconfig.me | pbcopy"
alias kite='open -a Kitematic\ \(Beta\)'
alias l="ls -AlGp"
alias launchdir='cd ~/Library/LaunchAgents'
alias mmv='noglob zmv -W'
alias n='cd ~/Dropbox/Documents/Notes'
alias npmg="npm list -g --depth=0 2>/dev/null"
alias npmgo="npm outdated -g --depth=0"
alias npml="npm list --depth=0"
alias npmlo="npm outdated --depth=0"
alias ojp='cd ~/Dropbox/Documents/Project\ Documents/Owen\ Jones'
alias p='cd /Users/Shared/Development/Projects'
alias pdoc='cd ~/Dropbox/Documents/Project\ Documents'
alias precomp="RAILS_ENV=production bundle exec rake assets:precompile"
alias rake='noglob rake' # allows rake and zsh to get along
alias rakem="bundle exec rake db:migrate"
alias rakemt="bundle exec rake db:migrate RAILS_ENV=test"
alias raker="bundle exec rake db:rollback"
alias rakert="bundle exec rake db:rollback RAILS_ENV=test"
alias repos="cd /Users/Shared/Development/GitRepos"
alias res='cd ~/Dropbox/Documents/Resume'
alias rmorig="find . -name \"*.orig\" -exec rm '{}' ';'"
alias secret="ruby -rsecurerandom -e 'puts SecureRandom.hex(32)' | pbcopy; echo '32-byte hex secret copied to clipboard!'"
alias sites="cd ~/sites"
alias ssh='TERM=xterm-256color ssh'
alias todo='cd ~/Dropbox/Todo'
alias tree2="tree -L 2"
alias tree3="tree -L 3"
alias tree4="tree -L 4"
alias tree="tree -CAa"
alias v="nvim ."
alias vag='vagrant'
alias vagde="vagrant destroy"
alias vagssh="vagrant ssh"
alias vagsshc="vagrant ssh-config"
alias vagst="vagrant global-status"
alias vagup="vagrant up"
alias vim='nvim'
alias vimalias='vim ~/.zshrc.d/aliases.zsh'
alias xcode="/Users/Shared/Development/Xcode/Projects"
alias xplug="~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins"
