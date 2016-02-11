function lll() {
  ls -AlGp | awk '{printf("%s\t%4s\t%s\t%s\n", $1, $2, $3, $4)}'
}
