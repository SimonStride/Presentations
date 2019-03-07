<#

The Magical Pipe of dreams...

#>

# Select the first 10 results
Get-Process | Select-Object -First 10


# Use a WHERE filter in PoShland
Get-Process | Where-Object { $_.Name -like "v*"}


# Keep on chain-piping...
Get-Process | Where-Object { $_.Name -like "v*"} | Select-Object -First 3


# Or pipe to a loop and use the $_ object
Get-Process | Select-Object -First 3 | ForEach-Object {
    $_
}