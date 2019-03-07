<#

# Chapter 1 - The basics!!!

#>

# Variables
$variableText = "string"
$variableInt = 1
$variableDate = Get-Date

$variableText.GetType()
$variableInt.GetType()
$variableDate.GetType()

# String operations
$variableText.TrimEnd("ing")

Write-Host "This is the first variable: $variableText`n...and this is the second: $variableInt"

Write-Host "I like colour!" -ForegroundColor Magenta

Write-Warning "Hello, Warning!"

Write-Error "Oh, sh..."




# List
$alphabet = @("a", "b", "c", "d", "e", "f", "g", "...", "z")
$alphabet


# Loop through a list
foreach($letter in $alphabet) {
    Write-Host $letter -ForegroundColor Green
}




# Lists are 0-indexed
$alphabet[0]

# if statements work as expected
if ($alphabet[0] -eq "a") {
    Write-Host "We're only at the start of the list!" -ForegroundColor Blue
}


