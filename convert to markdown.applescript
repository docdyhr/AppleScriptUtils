on run {input, parameters}
	set inputText to input as string
	-- `do shell script` runs with a minimal PATH, so add the usual install
	-- dirs: Homebrew on Apple Silicon (/opt/homebrew) and Intel (/usr/local),
	-- plus MacPorts (/opt/local). pandoc is then resolved wherever it lives.
	set shellPrefix to "export PATH=/opt/homebrew/bin:/usr/local/bin:/opt/local/bin:$PATH; "
	try
		set pandocPath to do shell script shellPrefix & "command -v pandoc"
	on error
		display alert "Pandoc not found" message "Install it with:  brew install pandoc" as critical
		return
	end try
	set markdownText to do shell script quoted form of pandocPath & " -f html -t markdown <<< " & quoted form of inputText
	set the clipboard to markdownText
	return markdownText
end run
