#!/usr/bin/osascript


tell application "Finder"
    set currentPath to POSIX path of (insertion location as alias)
end tell
do shell script "open -na Ghostty --args --working-directory=" & quoted form of currentPath

