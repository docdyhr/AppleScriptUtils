(* Version 1.1 with multible unix paths thomas@dyhr.com Feb 2021 *)
on run {input, parameters}
	if the (count of input) is 1 then --normal usecase
         --qouted form is more secure with the use of  space in mac alias
		set the clipboard to quoted form of POSIX path of input
	else
		set unixPathList to ""
		repeat with macAlias in input
			set unixPathList to unixPathList & quoted form of POSIX path of macAlias & " "
		end repeat
		set the clipboard to unixPathList
	end if
    
	return input
end run