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

Write-Host "The next bit will error on purpose:`n-------------------------------"
Write-Error "OH, SH......`n...`n...`n...ELL!`n"




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
# BUT "=" is expressed as "-eq"
if ($alphabet[0] -eq "a") {
    Write-Host "We're only at the start of the list!" -ForegroundColor Blue
}

# -gt ... Greater Than
if ( 1 -gt 0 ) {
    Write-Host "1 is indeed greater than 0"
}

#=============================================
# EQUALITY OPERATORS - NOT THE USUAL!!!
#=============================================
# -gt ... Greater Than
# -ge ... Greater Than or Equal To
# -lt ... Less Than
# -le ... Less Than or Equal To
# -like
# -in
# -notin
# -contains
# -notcontains