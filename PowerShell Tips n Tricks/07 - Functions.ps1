<#

One of the best ways to split up splits into reusable components is 
splitting your code into functions and/or into separate files

e.g. I've added functions to 07a.ps1 and 07b.ps1

#>

# Example function
function Get-FileCountExample([string]$folderPath) {

    return (Get-ChildItem $folderPath).count

}

# Use the function
Get-FileCountExample "C:\Projects\Presentations"


# Or import functions from another file using a "." ref
./07a.ps1
# Function is now loaded and can be called.
# Parameters are called using dashes, rather than brackets
Get-MyFileCount -sourceFolder "C:\Projects\Presentations"


# Another common way to call a script is to set parameters 
# at the start of the file e.g. 07b.ps1
./07b.ps1 -sourceFolder "C:\Projects\Presentations"

# This means that you can parameterise scripts and safely commit 
# them to Source Control without storing sensitive information
# such as Connection Strings or Passwords!!! 
# The parameters can then be passed by the calling program 
# e.g. 
#       a build/CI server
#       deployment server
#       ARM or Terraform templates
#       Monitoring systems