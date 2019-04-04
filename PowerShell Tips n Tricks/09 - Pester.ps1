<#

PESTER

Pester is a Testing Framework for PowerShell, written in PowerShell
Pester can be used for Unit Tests and Operational Testing

Available in the Gellery using Install-Module Pester

These simple examples can be run inline; normally tests should be in
separate files with the naming convention:
    <Name of Script Under Test>.Tests.ps1
#>


# Unit Testing a simple function
function Add-TwoStrings([string]$string1, [string]$string2) {
    $output = $string1 + $string2
    return $output
}

Add-TwoStrings -string1 "abc" -string2 "wtf"



# Tests for a CI Server
Describe MyExampleFunction {
    It "Should join two string values" {
        Add-TwoStrings "a" "b" | Should -Be "ab"
    }
    
    It "Should join two int values" {
        Add-TwoStrings 1 2 | Should -Be "12"
    }
    
    It "Should handle one Null" {
        Add-TwoStrings "a" $null | Should -Be "a"
    }

    It "Should handle two Nulls" {
        Add-TwoStrings $null $null | Should -Be ""
    }
}







# Operational testing
# Aim: Make sure I have a SQL2017 Instance running!
Get-Service -Name "MSSQL`$SQL2017"
# Tests for a monitoring mechanism
Describe LocalSQLService {

    it "Should have a SQL2017 Instance" {
        $Error.Clear()
        $svc = (Get-Service -Name "MSSQL`$SQL2017")
        $Error.Count | Should -Be 0
        $svc.Count | should -be 1

    }
    it "Should NOT have a SQL2015 Instance" {
        try {
            $svc = (Get-Service -Name "MSSQL`$SQL2015" -ErrorAction SilentlyContinue)
        } catch {}
        $svc.Count | Should -Be 0
    }

    it "Should be Running SQL2017" {
        (Get-Service -Name "MSSQL`$SQL2017").Status | Should -Be "Running"
    }
    
    it "Should have a display name of `"SQL Server (SQL2017)`"" {
        (Get-Service -Name "MSSQL`$SQL2017").DisplayName | Should -Be "SQL Server (SQL2017)"
    }
}

