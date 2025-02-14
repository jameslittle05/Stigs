<#
.SYNOPSIS
    This PowerShell script ensures that WDigest Authentication must be disabled.

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2025-02-14
    Last Modified   : 2025-02-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000120

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000120).ps1 
#>


# Define the registry path and the value name
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$valueName = "DontDisplayNetworkSelectionUI"
$valueData = 1

# Check if the registry key exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "Registry value set successfully."
