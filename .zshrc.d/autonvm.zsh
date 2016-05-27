# Auto change the nvm version based on a .nvmrc file based on the current directory. See https://github.com/creationix/nvm/issues/110#issuecomment-190125863
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    cur_node=`nvm current`
    nvmrc_node=`cat .nvmrc`
    if [[ "$cur_node" != "v$nvmrc_node" ]]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc

if [ "$TMUX" ]; then
  if [[ -f .nvmrc && -f .nvmrc ]]; then
    load-nvmrc
  fi
fi
