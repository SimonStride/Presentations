<#

04 - Saving to files

* PowerShell makes handling files as objects super easy

#>

# clean setup
Remove-Item outputs -Force -Recurse
mkdir outputs -force

# Get the processes on a local or remote computer.
# Store the data in a csv using a "|" delimiter
Get-Process | Select-Object -Property Id,ProcessName,SI,StartTime,CPU | `
        Export-Csv ".\outputs\processes.csv" -NoClobber -NoTypeInformation -Delimiter "|"
        
#View the file 
notepad ".\outputs\processes.csv"



# Pull back in the CSV
$obj = Import-Csv ".\outputs\processes.csv" -Delimiter "|" 
$obj | sort-object CPU -Descending | select-object -First 10 | format-table




# swap into json, xml, txt
$obj | ConvertTo-Json | out-file ".\outputs\Json-processes.json" -NoClobber
$obj | Export-Clixml ".\outputs\Xml-processes.xml" -NoClobber
$obj | Format-Table | Out-File ".\outputs\Text-processes.txt" -NoClobber