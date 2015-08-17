if application "Google Chrome" is running then
	tell application "Google Chrome"
		repeat with t in tabs of windows
			tell t
				if URL starts with "http://playlister.atalwar.com" then
					set theName to execute JavaScript "document.getElementById(tempor+'playListEntries').getElementsByClassName('nowPlaying')[0].getElementsByClassName('playlistEntryTitle')[0].innerHTML" 
					if theName is not missing value then
						try 
							return "♫ " & theName
							on error err
						end try
					end if
				end if
			end tell
		end repeat
	end tell
end if
