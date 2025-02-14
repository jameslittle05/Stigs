<#
.SYNOPSIS
    This PowerShell script ensures that The Windows Remote Management (WinRM) client must not allow unencrypted traffic.

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2025-02-14
    Last Modified   : 2025-02-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000330

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000330).ps1 
#>


# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$valueName = "AllowBasic"
$valueType = "DWORD"
$value = 0

# Check if the registry path exists
if (-not (Test-Path $regPath)) {
    # Create the registry path if it doesn't exist
    New-Item -Path $regPath -Force
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $value -Type $valueType

# Verify if the value was set correctly
$regValue = Get-ItemProperty -Path $regPath -Name $valueName
Write-Host "Registry value '$valueName' set to: $($regValue.$valueName)"
