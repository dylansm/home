url_encode() {
  pb=$(echo `pbpaste`)
  # $(echo `ruby -ruri -e "puts URI::escape(%Q($pb))"` | pbcopy)
  # $(echo `ruby -rcgi -e "puts CGI::escape(%Q($pb)).gsub(/\+/, '%20')"` | pbcopy)
  $(echo `ruby -rcgi -e "puts CGI::escape_html(%Q($pb)).gsub(/\+/, '%20')"` | pbcopy)
}

purlc() {
  url_encode
}
