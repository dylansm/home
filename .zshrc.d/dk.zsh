dkp() {
  docker ps | awk -v OFS='\t' '{print $01, $NF}'
}

dka() {
  docker ps -a | awk -v OFS='\t' '{print $01, $NF}'
}
