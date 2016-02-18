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
      printf(ENVIRON["Underscore"]ENVIRON["Italic"]ENVIRON["Cyan"]"%-28s %-10s %-15s %-17s %-9s\n"ENVIRON["Plain"], "Repository", "Tag", "Image ID", "Created", "Size")
      print ""
    } else {
      printf(ENVIRON["Bone"]"%-28s %-10s %-15s %-2s %7s %-6s %s %s\n", $1, $2, $3, $4, $5, $6, $7, $8)
    }
  }'
}

dkrm() {
  running_count=$(docker info | grep Running: | awk '{print $NF}')
  paused_count=$(docker info | grep Paused: | awk '{print $NF}')
  stopped_count=$(docker info | grep Stopped: | awk '{print $NF}')
  if [[ $running_count == "0" && $paused_count == "0" && $stopped_count == "0" ]]; then
    print "\n`echo $Red`There are no containers to remove."
  elif [[ ! $running_count == "0" || ! $paused_count == "0" ]]; then
    if [[ $# -eq 0 ]]; then
      unset tmp
      vared -p "`print $Yellow`Are you sure you want to stop and remove all containers? (y/n):`echo $Plain` " -c tmp

      if [[ $tmp =~ ^[Yy]$ ]]; then
        docker stop $(docker ps -a -q)
        docker rm $(docker ps -a -q)
      fi

    else
      docker stop $(docker ps -a -f name=$1 -q)
      docker rm $(docker ps -a -f name=$1 -q)
    fi
  elif [[ ! $stopped_count == "0" ]]; then
    if [[ $# -eq 0 ]]; then
      unset tmp
      vared -p "`print $Yellow`Are you sure you want to remove all stopped containers? (y/n):`echo $Plain` " -c tmp

      if [[ $tmp =~ ^[Yy]$ ]]; then
        docker rm $(docker ps -a -q)
      fi

    else
      docker rm $(docker ps -a -f name=$1 -q)
    fi
  fi
}

dkde() {
  image_count=$(docker info | grep Images: | awk '{print $NF}')
  if [[ $image_count == "0" ]]; then
    print "\n`echo $Red`There are no docker images to delete."
  else
    if [[ $# -eq 0 ]]; then
      unset tmp
      print ''
      vared -p "`echo $Yellow`Are you sure you want to remove all images? (y/n):`echo $Plain` " -c tmp

      if [[ $tmp =~ ^[Yy]$ ]]; then
        docker rmi -f $(docker images -q)
      fi
    else
      docker rmi -f $(docker images | grep "$1" | awk '{print $3}')
    fi
  fi
}
