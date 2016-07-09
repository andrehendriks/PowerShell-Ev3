#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests. 
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#

Describe "Drive" {
	Context "Function Exists" {
		It "Should Return" {
		function forwrd {
<#
.Parameter Direction
.Example Drive -Direction "forwrd"
#>
[CmdletBinding()]

param(
[Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
[System.String]
[validateset('forward','back','left','right')]
$Direction
)
begin {
        try {
        Add-Type -AssemblyName "lego.ev3.desktop" -ErrorAction Stop
             
        }
        catch {
            Write-Error -Message "Error loading the requered assemblies"
        }
    }
process {
$btc = New-Object -TypeName Lego.Ev3.Desktop.BluetoothCommunication
$brick = New-Object -TypeName Lego.Ev3.Core.Brick $btc
$brick.ConnectAsync()
if ($Direction = 'forward') {
$brick.DirectCommand.StepMotorAtSpeedAsync(@("B","C"), 50, 1000, $false)
}

else {
$brick.DirectCommand.StopMotorAsync()
}    
    }
    end {
    $brick.Disconnect()
    }
}
function backward {
<#
.Parameter Direction
.Example Drive -Direction "backward"
#>
[CmdletBinding()]

param(
[Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
[System.String]
[validateset('forward','back','left','right')]
$Direction
)
begin {
        try {
             Add-Type -AssemblyName "lego.ev3.desktop" -ErrorAction Stop
        }
        catch {
            Write-Error -Message "Error loading the requered assemblies"
        }
    }
process {
$btc = New-Object -TypeName Lego.Ev3.Desktop.BluetoothCommunication
$brick = New-Object -TypeName Lego.Ev3.Core.Brick $btc
$brick.ConnectAsync()
if ($Direction = 'backward') {
$brick.DirectCommand.StepMotorAtSpeedAsync(@("B","C"), 50, 1000, $false)
}

else {
$brick.DirectCommand.StopMotorAsync()
}    
    }
    end {
    $brick.Disconnect()
    }
}
function left {
<#
.Parameter Direction
.Example Drive -Direction "left"
#>
[CmdletBinding()]

param(
[Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
[System.String]
[validateset('forward','back','left','right')]
$Direction
)
begin {
        try {
             Add-Type -AssemblyName "lego.ev3.desktop" -ErrorAction Stop
        }
        catch {
            Write-Error -Message "Error loading the requered assemblies"
        }
    }
process {
$btc = New-Object -TypeName Lego.Ev3.Desktop.BluetoothCommunication
$brick = New-Object -TypeName Lego.Ev3.Core.Brick $btc
$brick.ConnectAsync()
if ($Direction = 'left') {
$brick.DirectCommand.StepMotorAtSpeedAsync(@("C"), 50, 1000, $false)
}

else {
$brick.DirectCommand.StopMotorAsync()
}    
    }
    end {
    $brick.Disconnect()
    }
}
function right {
<#
.Parameter Direction
.Example Drive -Direction "right"
#>
[CmdletBinding()]

param(
[Parameter(Position=0, Mandatory=$true, ValueFromPipeline=$true)]
[System.String]
[validateset('forward','back','left','right')]
$Direction
)
begin {
        try {
             Add-Type -AssemblyName "lego.ev3.desktop" -ErrorAction Stop
        }
        catch {
            Write-Error -Message "Error loading the requered assemblies"
        }
    }
process {
$btc = New-Object -TypeName Lego.Ev3.Desktop.BluetoothCommunication
$brick = New-Object -TypeName Lego.Ev3.Core.Brick $btc
$brick.ConnectAsync()
if ($Direction = 'right') {
$brick.DirectCommand.StepMotorAtSpeedAsync(@("B"), 50, 1000, $false)
}

else {
$brick.DirectCommand.StopMotorAsync()
}    
    }
    end {
    $brick.Disconnect()
    }
  }
		}
	}
}