# alias bb="nesh -b"
# alias dkl="docker logs -f"
# alias dkrms="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
# alias dkrms="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
# alias dkrs="docker ps -aq --no-trunc | xargs docker rm"
# alias dkrs="docker ps -aq --no-trunc | xargs docker rm"
# alias pip3="docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:3-alpine pip3"
# alias python3="docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:3-alpine python"
# alias python3="docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:3-alpine python"
# alias python="docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:2-alpine python"
# alias python="docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:2-alpine python"
# alias v='docker run --rm -it -v $HOME/.config/nvim:/root/.config/nvim -v $HOME/.config/nvim/docker_share:/root/.local/share/nvim --name neovim neovim nvim .'
# alias vim='docker run --rm -it -v $HOME/.config/nvim:/root/.config/nvim -v $HOME/.config/nvim/docker_share:/root/.local/share/nvim --name neovim neovim'
# alias vimrc="vim ~/.vimrc"
#alias bb="babel-repl"
#alias be='bundle exec'
#alias brake='bundle exec rake'
#alias brewi='brew install'
#alias brewup="brew update && brew cleanup"
#alias bundled="echo '\nInstalling gems for development and test only...\n'; bundle install --without production staging"
#alias mpcc='mpc listall | wc -l'
#alias mpcg='mpc listall | grep -Ei '
#alias mpcp="mpc playlist"
#alias mpct="mpc toggle"
#alias mpcu="mpc update"
#alias precomp="RAILS_ENV=production bundle exec rake assets:precompile"
#alias proto="cd ~/Dev/prototypes"
#alias python=python3
#alias rake='noglob rake' # allows rake and zsh to get along
#alias rakem="bundle exec rake db:migrate"
#alias rakemt="bundle exec rake db:migrate RAILS_ENV=test"
#alias raker="bundle exec rake db:rollback"
#alias rakert="bundle exec rake db:rollback RAILS_ENV=test"
#alias redis28-server="redis28-server /usr/local/etc/redis28.conf"
alias ...='cd ../../'
alias ..='cd ../'
alias awscomp="source /usr/local/bin/aws_zsh_completer.sh"
alias bin='if [ -d ./bin ]; then cd bin; else cd ~/bin; fi'
alias brewc="brew leaves | pbcopy"
alias calias="pcat ~/.zshrc.d/aliases.zsh"
alias caski="brew cask install"
alias clearlog="sudo cat /dev/null > "
alias cloj='cd ~/dev/Clojure'
alias ctag='ctags -R --exclude=.git --exclude=log --exclude=tmp *'
alias curlh='curl -IL '
alias d='cd ~/Desktop'
alias ddo="doctl"
alias ddoc="doctl compute"
alias ddocd="doctl compute droplet"
alias dev='cd ~/dev'
alias dk="docker"
alias dock='cd ~/dev/Docker'
alias down="cd ~/Downloads"
alias dsites="cd ~/Dropbox/Sites"
alias exiftool='docker run --rm -v $(PWD):/tmp dylansm/exiftool'
alias ffmpeg='docker run --rm -v $PWD:/temp jrottenberg/ffmpeg:3.4-alpine'
alias gistg='gist -l | grep '
alias gitf='git fetch'
alias gitm='git merge'
alias gitref="git reflog --date=iso"
alias gitu='git add -u'
alias gitv="git remote -v"
alias gp="cd /Users/dylan/dev/go/bin/src"
alias gr='cd ~/Dev/GitRepos'
alias h="heroku"
alias history='history 0'
alias icd="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias ipc="curl ifconfig.me | pbcopy"
alias kdiff="git difftool -y -t Kaleidoscope"
alias kmerge="git mergetool -y -t Kaleidoscope"
alias letterhead='cd ~/Documents/Letterhead'
alias ll="ls -AlGp"
alias mm='bundle exec middleman'
alias mmv='noglob zmv -W'
alias notes="cd ~/Documents/Notes"
alias npmg='npm list -g --depth=0 2>/dev/null'
alias npmgo="npm outdated -g --depth=0"
alias npml="npm list --depth=0"
alias npmlo="npm outdated --depth=0"
alias open="open ."
alias p='cd ~/Dev/Projects'
alias pdoc='cd ~/Documents/Project\ Documents'
alias proj="cd ~/Documents/Documents/Project\ Documents/"
alias pva="source ./bin/activate"
alias pvd="deactivate"
alias quote="cd ~/Documents/Quotes"
alias res='cd ~/Documents/Resume'
alias rmorig="find . -name \"*.orig\" -exec rm '{}' ';'"
alias salias="source ~/.zshrc.d/aliases.zsh"
alias secret="ruby -rsecurerandom -e 'print SecureRandom.hex(32)' | pbcopy; echo '32-byte hex secret copied to clipboard!'"
alias sites="cd ~/sites"
alias spm="swift package manager"
alias spmgx="swift package manager generate-xcodeproj"
alias ssh='TERM=xterm-256color ssh'
alias todo='cd ~/Documents/Todo'
alias tree2="tree -L 2"
alias tree3="tree -L 3"
alias tree4="tree -L 4"
alias tree="tree -CAa"
#alias v="nvim ."
#alias vim="nvim"
#alias vimrc="vim ~/.config/nvim/init.vim"
alias xcode="cd ~/Dev/Xcode/Projects"
alias xplug="cd ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins"
alias xprefs="find ~/Library/Developer/CoreSimulator/Devices -type f -name "
alias yarng="yarn global ls"
alias zalias='vim ~/.zshrc.d/aliases.zsh'
alias zpro="vim ~/.zprofile"
