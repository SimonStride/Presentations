<#

Cmdlets are essentially functions, with parameters and switches

Cmdlets generally follow a descriptive verb-noun naming pattern

#>

#Examples
Get-Process

Get-Service

Start-Process Notepad.exe



# Get some info on the cmdlet
Get-Help Get-Process

# Get even more help
Get-Help Get-Process -Examples

# Assign the outputs of a cmdlet to a variable
$Processes = Get-Process
#
$Processes

# Get just one bit of info (use quotes for titles with spaces)
$Processes."ProcessName"

# Open Notepad
start-process Notepad.exe

# Find the process ID for notepad
$Notepad = (Get-process -Name Notepad)
$Notepad

# Close notepad
stop-process $Notepad.Id




# Write a value to a file
"a Value" > "a file.txt"

# Open the file in notepad
start-process notepad.exe -ArgumentList "./a file.txt"
# Try to close notepad
$Notepad = (Get-process -Name Notepad)
stop-process $Notepad.Id

# Try to delete the file
Remove-Item "./a file.txt"




# make a directory
mkdir "dir"
"more text" > "./dir/another file.txt"
Remove-Item "dir"

# Or specify "recurse" upfront
mkdir "dir"
"more text" > "./dir/another file.txt"
Remove-Item "dir" -recurse
