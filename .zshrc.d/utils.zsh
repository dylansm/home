url_encode() {
  pb=$(echo `pbpaste`)
  # $(echo `ruby -ruri -e "puts URI::escape(%Q($pb))"` | pbcopy)
  # $(echo `ruby -rcgi -e "puts CGI::escape(%Q($pb)).gsub(/\+/, '%20')"` | pbcopy)
  $(echo `ruby -rcgi -e "print CGI::escape_html(%Q($pb)).gsub(/\+/, '%20')"` | pbcopy)
}

purlc() {
  url_encode
}

unix_escape() {
  pb=$(echo `pbpaste`)
  $(echo `ruby -rShellwords -e "print Shellwords.escape(%Q($pb))"` | pbcopy)
}

punic() {
  unix_escape
}

replaceSpaces() {
  # use "$@*" to pass $@ as a single parameter to this function
  # default to '_' unless 2nd arg passed
  replacement=${2:-_}
  echo ${1// /$replacement}
}

