param(
    [string]$sourceFolder = "C:/Temp" #Default
)

Write-Host (Get-ChildItem $sourceFolder).count -ForegroundColor Green