<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2025-02-14
    Last Modified   : 2025-02-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000295).ps1 
#>


# Define the registry path and the value name
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds"
$valueName = "DisableEnclosureDownload"
$valueType = "DWORD"
$valueData = 1

# Check if the registry key exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value to the desired value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type $valueType

Write-Host "Registry value set successfully."
