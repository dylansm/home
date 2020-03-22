#!/usr/bin/osascript

set theApplication to "Applications:Adobe Photoshop 2020:Adobe Photoshop 2020.app" as alias
tell application "Finder"
  set theFile to selection
	open theFile using theApplication
end tell
