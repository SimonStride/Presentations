<#

One of the hidden advantages on PowerShell is the abililty to leverage .Net Dlls and Com objects

#>


#For example, pulling in Microsoft's Speech API to do tongue twisters
$s = New-Object -ComObject sapi.spvoice
$s.rate = 1
for($i = 0; $i -lt 5; $i++) {
    $s.speak("How much wood would a wood chuck chuck if a wood chuck could chuck wood?")
    $s.rate = ($i+1) * 5
}

# Clearly, this might not be fully functional on all platforms!!!

# Other examples where this is commonly used include interacting with MS Office APIs

# ...
$s.rate = 1
$s.speak("Thanks for listening!")

# And seeing as this originated with Command Line, you can also run other CLI tools
git status
git pull
docker images

