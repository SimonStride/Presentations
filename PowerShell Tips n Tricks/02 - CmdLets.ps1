<#

Cmdlets are essentially functions, with parameters and switches

Cmdlets generally follow a descriptive verb-noun naming pattern
https://docs.microsoft.com/en-us/powershell/developer/cmdlet/approved-verbs-for-windows-powershell-commands

#>

# Examples
# =================================================
# Processes
Get-Process
# Services
Get-Service
# Hyper-V
Get-VM


# Get some info on the cmdlet
Get-Help Get-Process

# Get even more help
Get-Help Get-Process -Examples

# Assign the outputs of a cmdlet to a variable
$Processes = Get-Process
#
$Processes
$Processes.GetType()

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
"a value" > "./outputs/a file.txt"

# Open the file in notepad
start-process notepad.exe -ArgumentList "./outputs/a file.txt"
# Try to close notepad
$Notepad = (Get-process -Name Notepad)
stop-process $Notepad.Id

# Try to delete the file
Remove-Item "./outputs/a file.txt"


# make a directory
mkdir "dir"
"more text" > "./dir/another file.txt"
Remove-Item "dir"

# Or specify "recurse" upfront
mkdir "dir"
"more text" > "./dir/another file.txt"
Remove-Item "dir" -recurse


# Other Cmdlets allow you to reach beyond your laptop....
$Results = Invoke-WebRequest -Uri "www.google.co.uk" -Method "GET"
$Results.StatusCode
# View the whole lot...
$Results.InputFields

$Results.GetType()