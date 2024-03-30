on run {input, parameters}
    set inputText to input as string
    set pandocPath to "/usr/local/bin/pandoc" -- Adjust if your pandoc installation path is different
    set markdownText to do shell script pandocPath & " -f html -t markdown <<< " & quoted form of inputText
    set the clipboard to markdownText
    return markdownText
end run
