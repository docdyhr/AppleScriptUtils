(*
AppleScript to copy current path for a single file. The service is implemented as Quick Workflow with the Automator app in MacOSX.

thomas@dyhr.com 2019
*)

on run {input, parameters}
    if the count of input is 1 then
        set the clipboard to quoted form of POSIX path of input
    else
        display alert "Multible selections are not allowed!" as warning giving up after 5
    end if

    return input
end run
