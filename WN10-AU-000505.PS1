<#
.SYNOPSIS
    This PowerShell script ensures that Security event log size is configured to 1024000 KB or greater.

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2024-02-05
    Last Modified   : 2024-02-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Define registry path and parameters
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$valueName = "MaxSize"
$valueData = 1024000
$valueType = "DWord"

# Check if the registry path exists; if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type $valueType

# Verify the change
$updatedValue = Get-ItemProperty -Path $registryPath -Name $valueName
Write-Output "Registry value set: $($updatedValue.$valueName)"
