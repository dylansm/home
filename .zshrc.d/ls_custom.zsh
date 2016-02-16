function ll {
  export Bone=$'\x1b[38;2;180;192;170m'
  export Blue=$'\x1b[38;2;81;157;234m'
  export BrightBone=$'\x1b[38;2;193;204;180m'
  export BrightBlue=$'\x1b[38;2;88;171;254m'
  export BrightGreen=$'\x1b[38;2;156;214;117m'
  export BrightMagenta=$'\x1b[38;2;210;105;245m'
  export Cyan=$'\x1b[38;2;72;168;181m'
  export Green=$'\x1b[38;2;135;185;102m'
  export Magenta=$'\x1b[38;2;184;93;213m'
  export Red=$'\e[0;31m'
  export Yellow=$'\x1b[38;2;226;180;104m'
  export Italic=$'\e[3m'
  export Plain=$'\e[0m'

  if [[ $# -eq 1 ]]; then
    export target="`pwd`/$1"
  else
    export target=`pwd`
  fi

  # dotfiles
  ls -Alp $target | awk '$9 ~ /^\..+[^/]$/ {
    printf(ENVIRON["Bone"]"%-13s%4s  %s %s", $1, $2, $3, $4)
    $1=$2=$3=$4=$5=$6=$7=$8=""; printf(ENVIRON["Italic"]ENVIRON["BrightBone"]"%s\n"ENVIRON["Plain"], $0)
  }
  # dotfile directories
  $9 ~ /^\..+\/$/ {
    printf(ENVIRON["Green"]"%-13s%4s  %s %s", $1, $2, $3, $4)
    $1=$2=$3=$4=$5=$6=$7=$8=""; printf(ENVIRON["Italic"]ENVIRON["BrightGreen"]"%s\n"ENVIRON["Plain"], $0)
  }
  # regular directories
  $9 ~ /^[^.].+\/$/ {
    printf(ENVIRON["Magenta"]"%-13s%4s  %s %s", $1, $2, $3, $4)
    $1=$2=$3=$4=$5=$6=$7=$8=""; printf(ENVIRON["BrightMagenta"]"%s\n"ENVIRON["Plain"], $0)
  }
  # regular files
  $9 ~ /^[^.](\W?|\w?)+[^/]$/ {
    printf(ENVIRON["Blue"]"%-13s%4s  %s %s", $1, $2, $3, $4)
    $1=$2=$3=$4=$5=$6=$7=$8=""; printf(ENVIRON["BrightBlue"]"%s\n"ENVIRON["Plain"], $0)
  }'
}
