# pass lexer
# e.g. pless -l bash myfile.zsh
# passing that now by default
# pless() { pygmentize $* | less -R }
pless() { pygmentize -l bash $1 | less -R }
pcat() { pygmentize -l bash $1 | cat | less -R }

phtml() {
  if [[ $# -eq 0 ]]; then
    print "${Red}A lexer is required."
  else
    pbpaste | pygmentize -l $1 -f html -O full,style=monokai | pbcopy
    print ''
    print "`echo $Blue`HTML copied to clipboard."
  fi
}


