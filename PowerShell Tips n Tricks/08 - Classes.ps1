class PowerShellFan 
{
    # For extra complexity, PowerShell V5+ has Objected Oriented Class declarations!
    # By default, a property is public.
    # To get a property value from an object, use $obj.Name.
    # To set a property from an object, use $obj.Name = "New Name".
   
    [string] $FanName
    [int16] $FanAge

    static [string] $FanDescription = "PoSh Ninja"

    # Simple string Method
    [string] Greeting() {
        return "Howdy"
    }

    # Simple int Method
    [int16] GetAgeNextYear() {
        return $this.FanAge + 1
    }

    # Constructor
    PowerShellFan([string]$Name, [int16]$Age) {
        $this.FanName = $Name
        $this.FanAge = $Age
    }

}

[PowerShellFan]$Legend = [PowerShellFan]::New("Rob", 1000)
$Legend.FanName
$Legend.FanAge
$Legend.GetAgeNextYear()

# Credit https://xainey.github.io/2016/powershell-classes-and-concepts/#classes