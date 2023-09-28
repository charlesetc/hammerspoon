on run argv
  tell application "iTerm"
    create window with default profile command (item 1 of argv)
  end tell
end run 
