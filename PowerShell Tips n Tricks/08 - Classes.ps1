class PowerShellSuperHero 
{
    # For extra complexity, PowerShell V5+ has Objected Oriented Class declarations!
    # By default, a property is public.
    # To get a property value from an object, use $obj.Name.
    # To set a property from an object, use $obj.Name = "New Name".
   
    [string] $HeroName
    [int16] $HeroAge
    
    static [string] $HeroDescription = "PoSh Ninja"
    hidden [string] $Weakness

    # Simple string Method
    [string] Greeting() {
        return "Howdy"
    }

    # Simple int Method
    [int16] GetAgeNextYear() {
        return $this.HeroAge + 1
    }

    # Constructor
    PowerShellSuperHero([string]$Name, [int16]$Age, [string]$Weakness) {
        $this.HeroName = $Name
        $this.HeroAge = $Age
        $this.Weakness = $Weakness
    }

}

[PowerShellSuperHero]$Legend = [PowerShellSuperHero]::New("Superman", 81, "Kryptonite")
$Legend.HeroName
$Legend.HeroAge
$Legend.GetAgeNextYear()

# Credit https://xainey.github.io/2016/powershell-classes-and-concepts/#classes