alias dk='docker'
# alias dkat="docker attach"
alias dkc='docker compose'
alias dkcr="docker-compose run --rm --no-deps"
alias dkcu='docker-compose up -d'
alias dkinf='docker info'
alias dkins="docker inspect"
alias dkip="docker image prune"
alias dkk='docker kill'
alias dkn="docker network"
alias dknc="docker network create"
alias dkni="docker network inspect"
alias dknl="docker network ls"
alias dknp="docker network prune"
alias dknr="docker network rm"
alias dkri="docker rmi"
alias dkrid='docker rmi $(docker images -f "dangling=true" -q)'
alias dks='docker stop $(docker ps -q)'
alias dkv="docker volume"
alias dkvl="docker volume ls"
alias dkvp="docker volume prune"
alias dkvrd="docker volume rm $(docker volume ls -f dangling=true -q)"
alias dnsup="docker run -d --name dnsmasq --restart always -p 53535:53/tcp -p 53535:53/udp --cap-add NET_ADMIN andyshinn/dnsmasq --address=/dev/127.0.0.1"

alias k="kubectl"
alias kl="kubectl logs"
alias kgp="kubectl get pods"
alias kgd="kubectl get deployments"
alias kgs="kubectl get services"
alias krrd="kubectl rollout restart deployment"

