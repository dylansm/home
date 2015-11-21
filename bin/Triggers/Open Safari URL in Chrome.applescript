tell application "Safari" to set currentURL to URL of current tab of window 1
set theApp to "/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app" as POSIX file
tell application "Google Chrome"
	activate
	if (exists window 1) and (URL of active tab of window 1 is "chrome://newtab/") then
		tell window 1 to set URL of active tab to currentURL
	else
		open location currentURL
	end if
end tell
