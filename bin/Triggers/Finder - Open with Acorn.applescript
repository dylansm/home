#!/usr/bin/osascript

--set homeDir to POSIX path of (path to home folder from user domain)
--set appDir to POSIX path of (path to applications folder from user domain)
--set theApp to homeDir & appDir & "Acorn.app" as POSIX file
--set theApp to appDir & "Acorn.app" as POSIX file
--display dialog theApp

set theApp to "/opt/homebrew-cask/Caskroom/acorn/latest/Acorn.app" as POSIX file

tell application "Finder"
  set theFile to selection
  open theFile using theApp
end tell
