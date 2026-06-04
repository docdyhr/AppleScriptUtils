(* Version 2.0 - copy POSIX path(s) to clipboard, shell-quoted. thomas@dyhr.com *)
on run {input, parameters}
	set quotedPaths to {}
	repeat with anItem in input
		set end of quotedPaths to quoted form of POSIX path of anItem
	end repeat
	set {oldTID, AppleScript's text item delimiters} to {AppleScript's text item delimiters, " "}
	set the clipboard to (quotedPaths as text)
	set AppleScript's text item delimiters to oldTID
	return input
end run
