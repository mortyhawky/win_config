# Creating a Task Scheduler entry that starts
# komorebi.ahk at logon
#
# Abstract:
# Define what to run (exe+script)   -> New-ScheduledTaskAction
# When to run it                    -> New-ScheduledTaskTrigger
# Commit it                         -> Register-ScheduledTask
#
# 1.Define components:
$exe = "C:\Users\morty\scoop\apps\autohotkey\current\UX\AutoHotkeyUX.exe"
$arg = "C:\Users\morty\.config\autohotkey\komorebi.ahk"
$name = "AutoHotkey Komorebi"

# 2.Create the action
$action = New-ScheduledTaskAction `
    -Exexcute $exe `
    -Arguments $arg

# 3.Create trigger (at logon)
$trigger = New-ScheduledTaskTrigger `
    -AtLogOn `
    -User $env:USERNAME

Write-Host "`$exe = $exe"
Write-Host "`$arg = $arg"
Write-Host "`$name = $name"

