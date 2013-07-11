Set-ExecutionPolicy Unrestricted

# Aliases
Set-Alias edit "C:\Users\Tim\Documents\Synced Documents\Tools\Notepad++\notepad++.exe"
Set-Alias grep Select-String;
Set-Alias g git

if( $GLOBAL:go_locations -eq $null ) {
	$GLOBAL:go_locations = @{};
}
function go ([string] $location) {
	if( $go_locations.ContainsKey($location) ) {
		Set-Location $go_locations[$location];
	} else {
		Write-Output "The following locations are defined:";
		Write-Output $go_locations;
	}
}
$go_locations.Add("usr", "~")
$go_locations.Add("bin", "C:\bin")
$go_locations.Add("dev", "~\Development")
$go_locations.Add("netfx", "C:\Windows\Microsoft.NET")

Set-Location ~\Development

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load Posh modules
#Import-Module ".\Posh-Hg"
Import-Module ".\Posh-Git"

function prompt {
    # Directory
    Write-Host($pwd) -nonewline -ForegroundColor Blue

    # Mercurial Prompt
    #$Global:HgStatus = Get-HgStatus
    #Write-HgStatus $HgStatus
    
    # Git Prompt
    $Global:GitStatus = Get-GitStatus
    Write-GitStatus $GitStatus
    
    # Caret
    Write-Host ""
    Write-Host ">" -nonewline

    return " "
}

Pop-Location

Start-SshAgent -Quiet