#!/usr/bin/env osascript

tell application "iTerm"
  set newWindow to (create window with default profile)
  tell current session of first window
    write text "vim"
  end tell
end tell
