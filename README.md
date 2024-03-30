[![GitHub license](https://img.shields.io/github/license/docdyhr/AppleScriptUtils)](https://github.com/docdyhr/AppleScriptUtils/blob/master/LICENSE)

<p align="center">
  <img src="/images/logo.png" alt="Project Logo" width="200"/>
</p>

# AppleScript Utilities

Applescripts, workflows and services for Mac

## Services:

Implement with the Automator App as a Quick Command.

### copy path service applescript version 1.1

applescript service to copy current path as POSIX $PATH from the service menu in Finder with [CTRL] + CLICK

### md5 service applescript version 1.0

applescript service to calculate the md5sum of a downloaded file from the service menu in Finder with [CTRL] + CLICK

### sha256 service applescript version 1.0

applescript service to calculate the sha256 with openssl of a downloaded file from the service menu in Finder with [CTRL] + CLICK

### sha1 service applescript version 1.0

applescript service to calculate the sha1 sum with openssl of a downloaded file from the service menu in Finder with [CTRL] + CLICK

### sha256sum version 0.9

Drag & Drop applescript to quickly calculate and compare a 256 checksum for a downloaded file

### Cd to version 1.0

applescript to open current folder in Terminal from the Toolbar (save the applescript as an applescript application and store it Applications. Change the app icon if you want. Hold down the Command (⌘) key, then drag your script application to the toolbar of the Finder window.)

### Convert to Markdown version 1.0

This AppleScript converts the currently selected HTML text to Markdown format using Pandoc, then copies the converted Markdown text to the clipboard. To use it, select HTML text, run the script, and the Markdown version will be ready to paste from your clipboard.

## How to create an AppleScript service with Automator

Creating an AppleScript service with Automator allows you to integrate custom scripts into your macOS workflow, enabling you to perform actions on files, text, and other system features directly from the Finder or other applications.

### Step 1: Open Automator

1. Open Automator
2. Choose to create a new document

### Step 2: Choose a Type for Your Document

Select "Quick Action" as the type of your document.

### Step 3: Configure the Quick Action

1. At the top of the right pane, configure the Quick Action settings:
   - **Workflow receives current**: Choose "text" from the dropdown menu.
   - **In**: Select "any application" or specify if you want the service to be available in a specific app.
   - Optionally, you can choose an image to represent your Quick Action and assign a color.

### Step 4: Add an AppleScript Action

1. In the search field on the left pane, type "AppleScript" to find the "Run AppleScript" action.
2. Drag the "Run AppleScript" action to the workflow area on the right.

### Step 5: Enter Your AppleScript

1. In the "Run AppleScript" action that you've added to the workflow, you'll see a template script. Replace the template content with the AppleScript code. For the example of converting selected text to Markdown:

```applescript
on run {input, parameters}
    set inputText to input as string
    set pandocPath to "/usr/local/bin/pandoc" -- Adjust if your pandoc installation path is different
    -- Pandoc will try to auto-detect the input format
    set markdownText to do shell script pandocPath & " -t markdown <<< " & quoted form of inputText
    return markdownText
end run
```

### Step 6: Save Your Quick Action

1. Go to "File" > "Save" or press `Cmd + S`.
2. Name your Quick Action, such as "Convert to Markdown".
3. Click "Save".

### Step 7: Use Your Quick Action

- To use your new Quick Action, select some text in any application, right-click to open the contextual menu, navigate to the "Services" submenu, and select "Convert to Markdown". The converted Markdown text will replace the selected text or be copied to the clipboard, depending on how you've set up your script.
