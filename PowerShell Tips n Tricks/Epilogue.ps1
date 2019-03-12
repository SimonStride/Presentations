<#

Epilogue - the end...?
            _                                  __  _
 _ __ ___  (_)  ___  _ __   ___   ___   ___   / _|| |_
| '_ ` _ \ | | / __|| '__| / _ \ / __| / _ \ | |_ | __|
| | | | | || || (__ | |   | (_) |\__ \| (_) ||  _|| |_
|_| |_| |_||_| \___||_|    \___/ |___/ \___/ |_|   \__|

 _
| |  ___  __   __  ___  ___
| | / _ \ \ \ / / / _ \/ __|
| || (_) | \ V / |  __/\__ \
|_| \___/   \_/   \___||___/

 _  _                      _  _  _
| |(_) _ __   _   _ __  __| || || |
| || || '_ \ | | | |\ \/ /| || || |
| || || | | || |_| | >  < |_||_||_|
|_||_||_| |_| \__,_|/_/\_\(_)(_)(_)

#>


# Windows Subsystem for Linux (wsl)
# ===================================================================================================
# For Windows build 16215 or later (Windows)
# https://docs.microsoft.com/en-us/windows/wsl/install-win10
# 
# Allows you to start a Linux Bash prompt in Windows 
# without running a VM or switching laptops
# Works really well for things like ssh, python, ruby and linux-first CLIs
# NOT designed for Linux GUIs

wsl

# Run the next bits in WSL
# Check the root folder
cd /
ls

# Find my WINDOWS C: drive
cd /mnt/c
ls

# Go to this folder
cd /mnt/c/Projects/Presentations/PowerShell\ Tips\ \'n\'\ Tricks/
ls

# Within wsl, we can run PowerShell for linux!!!
# First check it's installed...
sudo apt list --installed | grep powershell
# Then step into PowerShell on linux!!
pwsh
$PSVersionTable
# Check we can run script 01.ps1 in LINUX
./01.ps1

exit # nested posh
logout #wsl