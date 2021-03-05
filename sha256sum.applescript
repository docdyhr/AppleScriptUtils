(*
AppleScript to calculate the sha256sum by thomas@dyhr.com 2019
*)

-- if applet is double-clicked
set chosenFile to choose file with prompt "Select file to SHA256Sum:" of type {"IMG", "ISO", "DMG", "OVA"} default location "/Users/thomas/Downloads" without multiple selections allowed
calculate_check_sum(chosenFile)


-- or if the file is drag and dropped
on open chosenFile
	if (count of chosenFile) = 1 then
		calculate_check_sum(chosenFile)
	else
		display alert "Multiple selections are not allowed!" giving up after 5
	end if
end open


-- calculate sha256sum and evaluate against given value
on calculate_check_sum(chosenFile)
	
	-- get filename
	set fileName to name of (info for chosenFile)
	
	-- get the sha256sum from webstite
	set checkSum to the text returned of (display dialog "Paste SHA256Sum" default answer "" with title fileName)
	
	--To do:
	-- show progress bar
	(*
-- Update the initial progress information
    set theItemsCount to 1
    set progress total steps to theItemsCount
    set progress completed steps to 0
    set progress description to "Processing file..."
    set progress additional description to "Preparing to process."

repeat with a from 1 to 1

        -- Update the progress detail
        set progress additional description to "Calculating check sum " & a & " of " & theItemsCount

*)
	-- Calculate checksum
	set checkSumResult to first word of (do shell script "/usr/bin/shasum -a 256 " & quoted form of POSIX path of chosenFile)
	
	
	(*
    -- Increment the progress
        set progress completed steps to a

        -- Pause for demonstration purposes, so progress can be seen
        delay 1
    end repeat

    -- Reset the progress information
    set progress total steps to 0
    set progress completed steps to 0
    set progress description to ""
    set progress additional description to ""
*)
	
	
	-- compairing check sums
	ignoring white space
		checkSumResult = checkSum
	end ignoring
	set checkSumComp to result
	
	-- setting & formating display text
	set displayText to checkSum & "
    " & first word of checkSumResult & "
	"&"
    "
	
	-- show checksum results to user
	if checkSumComp = true then
		display dialog displayText & "SHA256Sum OK!" buttons {"OK"} default button "OK" with title fileName
	else
		display dialog displayText & "NB! No SHA256Sum match!" buttons {"CANCEL"} default button "CANCEL" with title fileName with icon caution
	end if
	
end calculate_check_sum
