#!/usr/bin/osascript

tell application "Finder"
    set theSelection to selection
    if theSelection is {} then
        -- If nothing is selected, use the current folder
        set targetPath to POSIX path of (insertion location as alias)
    else
        -- If something is selected, use the first item
        set targetPath to POSIX path of (item 1 of theSelection as alias)
    end if
end tell

-- Run Ghostty as a login shell with the -e flag to execute nvim with the path
do shell script "open -na Ghostty --args -e /bin/zsh -l -c \"/opt/homebrew/bin/nvim " & quoted form of targetPath & "\""
