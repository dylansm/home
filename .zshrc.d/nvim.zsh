# need to figure out:
# - copy/paste
# - MRU
# - increment Docker container name
nvim() {
  if [[ $# -eq 0 ]]; then
    docker run --rm -it --name nvim -v $(pwd):/home/neovim/workdir dylansm/neovim nvim
  else
    if [[ -d "$1" ]]; then
      dir="$1"
      file="$1"
    else
      echo "here"
      dir=$(echo "$1" | sed 's|\(.*\)/.*|\1|')
      file=$(echo "$1" | sed 's:.*/::')
    fi

    if [[ $dir == "." ]] || [[ "$dir" == "$file" ]]; then
      dir=$(pwd)
    fi

    # if [[ "$dir" == [a-zA-Z]* ]]; then
      # echo "dir with no path"
    # fi

    if [[ "$dir" == .* ]] || [[ "$dir" == [a-zA-Z]* ]]; then
      echo "hidden or no full path provided"
      dir="$(pwd)/$dir"
    fi

    # echo "dir=$dir"
    # echo "file=$file"

    docker run --rm -it --name nvim -v $(echo $dir):/home/neovim/workdir dylansm/neovim nvim "$file"
  fi
}
