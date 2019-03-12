<#

Out-GridView is one of my favourite pseudo-GUI features

Windows only, and for interactive (user) sessions

# Out-Gridview provides a ready-made, interactive, searchable Window

#>

# Full version
Get-Process | Select-Object -Property ProcessName,Id,CPU | Out-GridView
# Short version for lazy folk like me
# Get-Process | ogv 


# Use the PassThru switch to get the selected items
Get-Process | Select-Object -Property ProcessName,Id,CPU | Out-GridView -PassThru | ForEach-Object {
    $Process = $_.ProcessName
    $Id = $_.Id
    Write-Host "Selected `"$Process`" with Process ID $Id" -ForegroundColor Magenta
}

# Same thing but assign results to a variable first
$results = Get-Process | Select-Object -Property ProcessName,Id,CPU | Out-GridView -PassThru

# Ask the user to be more specific
while ($results.count -gt 1) {
    $results = $results | Out-GridView -PassThru -Title "You need to pick only 1!"
}

$results | ForEach-Object {
    $Process = $_.ProcessName
    $Id = $_.Id
    Write-Host "Selected `"$Process`" with Process ID $Id" -ForegroundColor Magenta
}


# Start a stopped VM
# This script needs to be run as an admin
Get-VM | Where-Object { $_.Status -eq "stopped" } | Out-GridView -PassThru | ForEach-Object {
    $VMName = $_.Name
    Write-Host "Starting Hyper-V VM $VMName"
    Start-VM $VMName
}


