function lll() {
  export Yellow=$'\x1b[38;2;200;200;90m'
  export Green=$'\x1b[38;2;150;180;90m'
  export GreenDark=$'\x1b[38;2;130;150;110m'
  export Italic=$'\e[3m'
  export Red=$'\e[0;31m'
  export Plain=$'\e[0m'

  ls -Alp | awk '$9 ~ /^\..+[^/]$/ {
    printf(ENVIRON["Italic"]ENVIRON["Yellow"]"%-14s%s ∴ %s  %s\n"ENVIRON["Plain"], $1, $3, $4, $9)
  }
  $9 ~ /^\..+\/$/ {
    printf(ENVIRON["Italic"]ENVIRON["GreenDark"]"%-14s%s ∴ %s  %s\n"ENVIRON["Plain"], $1, $3, $4, $9)
  }
  $9 ~ /^[^.].+\/$/ {
    printf(ENVIRON["Italic"]ENVIRON["Green"]"%-14s%s ∴ %s  %s\n"ENVIRON["Plain"], $1, $3, $4, $9)
  }'

}
