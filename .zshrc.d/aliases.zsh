
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
alias calias="pcat ~/.zshrc.d/aliases.zsh"
alias caski="brew cask install"
alias clearlog="sudo cat /dev/null > "
alias cloj='cd ~/dev/Clojure'
alias code='cd ~/dev/Code_Library'
alias ctag='ctags -R --exclude=.git --exclude=log --exclude=tmp *'
alias curlh='curl -IL '
alias d='cd ~/Desktop'
alias dev='cd ~/dev'
alias dk='docker'
alias dkc='docker-compose'
alias dkin="docker inspect"
alias dkinf='docker info'
alias dkk='docker kill'
alias dkl='docker logs -f'
alias dknl="docker network ls"
alias dkrms="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
alias dks='docker stop $(docker ps -q)'
alias dku='docker-compose up -d'
alias dkvl="docker volume ls"
alias dkvr="docker volume rm $(docker volume ls -f dangling=true -q)"
# alias dm='docker-machine'
# alias dmip='docker-machine ip default'
# alias dmipc='docker-machine ip default | pbcopy'
# alias dmrc='docker-machine regenerate-certs default'
alias doc='cd ~/Dropbox/Documents'
alias dock='cd ~/dev/Docker'
alias down="cd ~/Downloads"
alias gistg='gist -l | grep '
alias gitf='git fetch'
alias gitm='git merge'
alias gitref="git reflog --date=iso"
alias gitu='git add -u'
alias gitv="git remote -v"
alias gp="cd /Users/dylan/dev/go/bin/src"
alias gr='cd ~/dev/GitRepos'
alias h="heroku"
alias history='history 0'
alias ipc="curl ifconfig.me | pbcopy"
alias kdiff="git difftool -y -t Kaleidoscope"
alias kite='open -a Kitematic\ \(Beta\)'
alias kmerge="git mergetool -y -t Kaleidoscope"
alias letterhead='cd ~/Dropbox/Documents/Letterhead'
alias ll="ls -AlGp"
alias mm='bundle exec middleman'
alias mmv='noglob zmv -W'
alias mpcc='mpc listall | wc -l'
alias mpcg='mpc listall | grep -Ei '
alias mpcp="mpc playlist"
alias mpct="mpc toggle"
alias mpcu="mpc update"
alias n='cd ~/Dropbox/Documents/Notes'
alias npmg='npm list -g --depth=0 2>/dev/null'
alias npmgo="npm outdated -g --depth=0"
alias npml="npm list --depth=0"
alias npmlo="npm outdated --depth=0"
alias ojp='cd ~/Dropbox/Documents/Project\ Documents/Owen\ Jones'
alias open="open ."
alias p='cd ~/dev/Projects'
alias pdoc='cd ~/Dropbox/Documents/Project\ Documents'
alias precomp="RAILS_ENV=production bundle exec rake assets:precompile"
alias proj="cd ~/Documents/Documents/Project\ Documents/"
alias rake='noglob rake' # allows rake and zsh to get along
alias rakem="bundle exec rake db:migrate"
alias rakemt="bundle exec rake db:migrate RAILS_ENV=test"
alias raker="bundle exec rake db:rollback"
alias rakert="bundle exec rake db:rollback RAILS_ENV=test"
alias res='cd ~/Dropbox/Documents/Resume'
alias rmorig="find . -name \"*.orig\" -exec rm '{}' ';'"
alias salias="source ~/.zshrc.d/aliases.zsh"
alias secret="ruby -rsecurerandom -e 'print SecureRandom.hex(32)' | pbcopy; echo '32-byte hex secret copied to clipboard!'"
alias sites="cd ~/sites"
alias spotclear="ssh -t vagrant@10.12.13.18 \"rm -rf /home/vagrant/nike-spot-2.0/storage/framework/sessions/*\""
alias spotfresh="spotnewdb && spotclear"
alias spotnewdb="ssh -t vagrant@10.12.13.18 \"mysql -uroot -psecret -e 'drop database if exists nikespot; create database nikespot;' && cd /home/vagrant/nike-spot-2.0 && php artisan migrate --seed --force\""
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
alias vimrc="vim ~/.vimrc"
alias xcode="cd ~/dev/Xcode/Projects"
alias xplug="cd ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins"
alias yarng="yarn global ls"
alias zpro="vim ~/.zprofile"
