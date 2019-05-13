


function Get-MyFileCount([string]$folderPath) {

    return (Get-ChildItem $folderPath).count

}

# Example
# Get-MyFileCount "C:\Projects\Presentations"