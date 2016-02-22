tl() {
  tmux_status=`tmux list-sessions 2>&1`
  print ''
  if [[ ${tmux_status} =~ ^no\ server ]]; then
    print "${Yellow}Tmux is not running."
  else
    printf "${Underscore}${Blue}%s %s\n${Plain}" "   Session         " "# Windows"
    print ''
    output=$(print $tmux_status | awk {'
      split($0, arrTSessions, ":")
      printf("%d."ENVIRON["Green"]" %-16s %-10d\n"ENVIRON["Plain"], NR, arrTSessions[1], arrTSessions[2])
    '})
    echo $output

    unset tmp
    vared -p "`echo $Bone`Attach session:`echo $Plain` " -c tmp
    if [[ $tmp =~ [0-9]+ ]]; then
      session=$(echo $output | grep -E "\s?$tmp\." | awk '{print $2}')
      `tmux attach-session -t $session`
    fi
  fi
}
