# list only directories
# Usage:
# llod -tr   - same but in chronological order oldest first
# llod -d a* - limit to directories beginning with letter 'a'
# llod -d .* - limit to hidden directories
lsd () {
  gls -l --color=always "$@" | egrep --color=never '^d|^[[:digit:]]+ d'
}

lld () {
  gls -al --color=always "$@" | egrep --color=never '^d|^[[:digit:]]+ d'
}

