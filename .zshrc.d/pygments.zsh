pless() { pygmentize $* | less -R }
pcat() { pygmentize $* | cat | less -R }
phtml() {
  if [[ $# -eq 0 ]]; then
    print "${Red}A lexer is required."
  else
    pbpaste | pygmentize -l $1 -f html -O full,style=monokai | pbcopy
    print ''
    print "`echo $Blue`HTML copied to clipboard."
  fi
}

