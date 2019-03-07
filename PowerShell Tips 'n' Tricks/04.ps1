<#

One of PowerShell's growing strengths is the community drive


# The PowerShell gallery hosts a wealth of community driven modules for you to use
# https://www.powershellgallery.com/
# ...or contribute to if you like.

# PowerShellKonf Europe
# The #PowerShellHelp tag on twitter is monitored 24/7
# 

#>


# getting hold of modules is as easy as...
Install-Module plaster
Install-Module SqlServer
Install-Module WriteAscii

# use a module by importing it...
Import-Module sqlserverM

# Get info about the module
Get-Module SqlServer

# Get information about the module
Get-Help SqlServer

# Run a SQL Query
$Results = Invoke-Sqlcmd -serverInstance ".\SQL2017" -Database "AdventureWorks2017" -Query "SELECT TOP 10 * FROM Person.Person"
$Results


# loop through results
$Results | ForEach-Object {
    Write-Ascii $_.FirstName
}
