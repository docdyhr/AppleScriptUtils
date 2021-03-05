(* Version 1.1  thomas@dyhr.com March 2021 
note: implement with automator - service - run applescript
*)
on run {input, parameters}
	
	set chosenFile to ""
	-- get file
	if (count of input) is 1 then
		set chosenFile to input
	else
		display alert "Multible selections are not allowed!" as warning giving up after 5
	end if
	
	-- get filename
	set fileName to name of (info for chosenFile)
	
	-- get the sha256 checksum text...
	set checkSum to the text returned of (display dialog "Paste SHA256" default answer "" with title fileName)
	
	-- Calculate MD5 sum checksum quitely and translate to UPPER case
	set checkSumResult to first word of (do shell script "/usr/bin/openssl dgst -sha256 " & quoted form of POSIX path of chosenFile & " | awk '{print $2}'")
	
	
	-- compairing check sums
	ignoring white space
		checkSumResult = checkSum
	end ignoring
	set checkSumComp to result
	
	-- setting & formating display text
	set displayText to "
	" & checkSum & "
	" & first word of checkSumResult & "
	"
	
	-- show checksum results to user
	if checkSumComp = true then
		display dialog displayText & "SHA256 OK!" buttons {"OK"} default button "OK" with title fileName
	else
		display dialog displayText & "NB! No SHA256 match!" buttons {"CANCEL"} default button "CANCEL" with title fileName with icon caution
	end if
	
	return input
end run