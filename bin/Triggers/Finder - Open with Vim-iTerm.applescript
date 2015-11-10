#!/usr/bin/osascript

tell application "Finder"
  set s to selection
  set selection_class to class of (item 1 of s) as string

  set dir to false
  if selection_class is in {"application file", "folder"} then
    set dir to true
    try
      tell application "System Events"
        set thePath to POSIX path of (s as alias)
      end tell
    on error errMsg
      display dialog "ERROR: " & errMsg
    end try
  else
    tell application "System Events"
      set theFile to POSIX path of (s as alias)
      set thePath to POSIX path of (container of (s as alias))
    end tell
  end if
end tell

tell application "iTerm"
  set newWindow to (create window with default profile)
  tell current session of first window
    if dir is true then
      write text "cd '" & thePath & "'; vim ."
    else
      write text "cd '" & thePath & "'; vim '" & theFile & "'"
    end if
  end tell
end tell
