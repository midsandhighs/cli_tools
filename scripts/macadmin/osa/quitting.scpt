tell application "System Events" 
    set apps to the name of every process whose background only is false
    repeat with prog in apps
    say prog
    end repeat
end tell
