function python_version() {
  if which pyenv &> /dev/null; then
    pyenv version | sed -e "s/ (set.*$//"
  fi
}
