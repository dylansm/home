
function ll {
  export Bone=$'\x1b[38;2;180;192;170m'
  export Blue=$'\x1b[38;2;81;157;234m'
  export BrightBone=$'\x1b[38;2;193;204;180m'
  export BrightBlue=$'\x1b[38;2;88;171;254m'
  export BrightGreen=$'\x1b[38;2;156;214;117m'
  export BrightMagenta=$'\x1b[38;2;210;105;245m'
  export BrightRed=$'\x1b[38;2;214;84;98m'
  export BrightYellow=$'\x1b[38;2;218;176;104m'
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

  ls -Alp $target | awk '
    function details(color) {
      printf(ENVIRON[color]"%-13s%5s   %8s ⟡ %-6s  %8s    %s %2s", $1, $2, $3, $4, $5, $6, $7)
    }

    function filename(color) {
      $1=$2=$3=$4=$5=$6=$7=$8=""
      {
        gsub (/^ +/, "", $0)
        printf(ENVIRON["Italic"]ENVIRON[color]"    %s\n"ENVIRON["Plain"], $0)
      }
    }

  # dotfiles
  $9 ~ /^\.([[:print:]]+ ?)+$/ && $1 ~ /^-/ {
    details("Bone")
    filename("BrightBone")
  }

  # dotfile directories
  $9 ~ /^\.([[:print:]]+ ?)+$/ && $1 ~ /^d/ {
    details("Green")
    filename("BrightGreen")
  }

  # regular directories
  $9 ~ /^[^.]([[:print:]]+ ?)+$/ && $1 ~ /^d/ {
    if ($1 ~ /^d(rwx){3}/) {
      details("Yellow")
      filename("BrightYellow")
    }
    else {
      details("Magenta")
      filename("BrightMagenta")
    }
  }

  # regular files
  $9 ~ /^[^.]([[:print:]]+ ?)*$/ {
    if ($1 ~ /^-(rwx){3}/) {
      details("Yellow")
      filename("BrightYellow")
    }
    else if ($1 ~ /^-([rw-]{2}x){3}/) {
      details("Red")
      filename("BrightRed")
    }
    else {
      details("Blue")
      filename("BrightBlue")
    }
  }'
}
