export Bone=$'\x1b[38;2;180;192;170m'
export DarkBone=$'\x1b[38;2;150;138;126m'
export Cyan=$'\x1b[38;2;72;168;181m'
export Green=$'\x1b[38;2;135;185;102m'
export Italic=$'\e[3m'
export Magenta=$'\x1b[38;2;184;93;213m'
export Plain=$'\e[0m'
export Underscore=$'\e[4m'

dkp() {
  print ""
  docker ps | awk -v OFS='\t' '
  {
    if ($1 == "CONTAINER") {
      printf(ENVIRON["Underscore"]ENVIRON["Italic"]ENVIRON["Green"]"%-16s %-40s\n"ENVIRON["Plain"], "Container", "Name")
      print ""
    } else {
      printf(ENVIRON["Bone"]"%-16s %s\n"ENVIRON["Plain"], $1, $NF)
    }
  }'
}

dka() {
  print ""
  docker ps -a | awk -v OFS='\t' '
  {
    if ($1 == "CONTAINER") {
      printf(ENVIRON["Underscore"]ENVIRON["Italic"]ENVIRON["Cyan"]"%-16s %-40s\n"ENVIRON["Plain"], "Container", "Name")
      print ""
    } else {
      if ($0 ~ /Exited/) {
        printf(ENVIRON["DarkBone"]"%-16s %s\n"ENVIRON["Plain"], $1, $NF)
      } else {
        printf(ENVIRON["Bone"]"%-16s %s\n"ENVIRON["Plain"], $1, $NF)
      }
    }
  }'
}

dki() {
  print ""
  docker images | awk -v OFS='\t' '
  {
    if ($1 == "REPOSITORY") {
      printf(ENVIRON["Underscore"]ENVIRON["Italic"]ENVIRON["Cyan"]"%-35s %-10s %-15s %-15s %-8s\n"ENVIRON["Plain"], "Repository", "Tag", "Image ID", "Created", "Size")
      print ""
    } else {
      printf(ENVIRON["Bone"]"%-35s %-10s %-15s %-2s %5s %-6s %s %s\n", $1, $2, $3, $4, $5, $6, $7, $8)
    }
  }'
}
