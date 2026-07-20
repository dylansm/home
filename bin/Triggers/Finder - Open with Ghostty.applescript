#!/usr/bin/osascript


--tell application "Finder"
    --set currentPath to POSIX path of (insertion location as alias)
--end tell
--#do shell script "open -na Ghostty --args --working-directory=" & quoted form of currentPath
--do shell script "open -na 'Ghostty' --args " & quoted form of ("--working-directory=" & currentPath)

--new
tell application "Finder"
    set currentPath to POSIX path of (insertion location as alias)
end tell

tell application "Ghostty"
    set cfg to new surface configuration
    set initial working directory of cfg to currentPath
    new window with configuration cfg
    activate
end tell
