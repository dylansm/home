alias ...='cd ../../'
alias ..='cd ../'
alias ani='ansible'
alias anip='ansible-playbook'
alias awscomp="source /usr/local/bin/aws_zsh_completer.sh"
alias bfg="java -jar ~/bin/bfg-1.12.6.jar"
alias bin='if [ -d ./bin ]; then cd bin; else cd ~/bin; fi'
alias brake='bundle exec rake'
alias brewup='brew update && brew upgrade brew-cask && brew cleanup'
alias brewi='brew install'
alias bundled="echo '\nInstalling gems for development and test only...\n'; bundle install --without production staging"
alias caski="brew cask install --appdir=/Applications --colorpickerdir=~/Library/ColorPickers"
alias clearlog="sudo cat /dev/null > "
alias cloj='cd /Users/Shared/Development/Clojure'
alias code='cd /Users/Shared/Development/Code_Library'
alias ctag='ctags -R --exclude=.git --exclude=log --exclude=tmp *'
alias cuc='cucumber'
alias curlh='curl -IL '
alias d='cd ~/Desktop'
alias dk='docker'
alias dm='docker-machine'
alias dev='cd /Users/Shared/Development'
alias doc='cd ~/Dropbox/Documents'
alias dock='cd /Users/Shared/Development/Docker'
alias gitf='git fetch'
alias gitm='git merge'
alias gitp='git clone "$(pbpaste)"'
alias gitu='git add -u'
alias gr='cd /Users/Shared/Development/GitRepos'
alias history='history 0'
alias ipc="curl ifconfig.me | pbcopy"
alias kite='open -a Kitematic\ \(Beta\)'
alias l="ls -lG"
alias ll="ls -alG"
#alias n="cd ~/Dropbox/Documents/Notes; vim -c 'FZF'"
alias npmg="npm list -g --depth=0 2>/dev/null"
alias npmlo="npm outdated --depth=0"
alias npmgo="npm outdated -g --depth=0"
alias npml="npm list --depth=0"
alias ojp='cd ~/Dropbox/Documents/Project\ Documents/Owen\ Jones'
alias p='cd /Users/Shared/Development/Projects'
alias pdoc='cd ~/Dropbox/Documents/Project\ Documents'
alias precomp="RAILS_ENV=production bundle exec rake assets:precompile"
alias pwdc="pwd | pbcopy"
alias rake='noglob rake' # allows rake and zsh to get along
alias be='bundle exec'
alias rakem="bundle exec rake db:migrate"
alias rakemt="bundle exec rake db:migrate RAILS_ENV=test"
alias raker="bundle exec rake db:rollback"
alias rakert="bundle exec rake db:rollback RAILS_ENV=test"
alias repos="cd /Users/Shared/Development/GitRepos"
alias res='cd ~/Dropbox/Documents/Resume'
alias rmorig="find . -name \"*.orig\" -exec rm '{}' ';'"
alias secret="ruby -rsecurerandom -e 'puts SecureRandom.hex(32)' | pbcopy; echo '32-byte hex secret copied to clipboard!'"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias todo='cd ~/Dropbox/Todo'
alias tree='tree -a'
alias tree="tree -I 'node_modules|.git'"
alias tree2="tree -L 2"
alias tree3="tree -L 3"
alias tree4="tree -L 4"
alias vag='vagrant'
alias vim='nvim'
alias vimalias='vim ~/.zshrc.d/aliases.zsh'
#alias vim="reattach-to-user-namespace vim"
alias xcode='cd /Users/Shared/Development/Xcode/Projects'

# The Program
#alias stumpup="vagrant ssh dev -c 'sudo salt-call state.highstate' && vagrant ssh dev -c 'sudo supervisorctl restart stumptown-puma'"
#alias stumptail="vagrant ssh dev -c 'sudo tail -f /var/log/supervisor/stumptown-puma-std* /var/log/supervisor/supervisord.log ~/stumptown/log/*.log'"
#alias stumptest="vagrant ssh dev -c 'cd stumptown/ && bundle exec rspec'"
#alias stumpbug="vagrant ssh dev -c 'cd stumptown/ && FORCE_SSL=false bundle exec rails server'"
#alias stumpbug="vagrant ssh dev -c 'cd stumptown/ && FORCE_SSL=false bundle exec rails server' -- -oSendEnv=dylansmith"
#alias stumpcon="vagrant ssh dev -c 'cd stumptown/ && bundle exec rails console'"
#alias stumpdb="vagrant ssh dev -c 'cd stumptown/ && bundle exec rails dbconsole -p'"
#alias stumpre="vagrant ssh dev -c 'sudo supervisorctl restart stumptown-puma'"
alias vagst="vagrant global-status"
alias vagde="vagrant destroy"
alias vagup="vagrant up"
alias vagssh="vagrant ssh"
alias vagsshc="vagrant ssh-config"
#alias vag="vagrant"
