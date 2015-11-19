cdd() {
  local needle=$(echo "$*" | sed -E 's/ +/.*/g')
  cd "`find . -type d -maxdepth 3 | grep -Ei "${needle}[^/]*$" | fzf -s 20 -1 -0 -q "$1"`"
}
