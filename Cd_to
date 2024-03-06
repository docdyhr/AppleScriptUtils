on run
    tell application "Finder"
        set theFolder to (folder of the front window) as alias
        set folderPath to POSIX path of theFolder
    end tell

    tell application "Terminal"
        activate
        do script "cd " & quoted form of folderPath in front window
    end tell
end run
