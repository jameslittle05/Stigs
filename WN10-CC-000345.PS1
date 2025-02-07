<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2025-02-07
    Last Modified   : 2025-02-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000345).ps1 
#>


# Define the registry key path
$regKeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"

# Check if the registry path exists, and create it if it doesn't
if (-not (Test-Path $regKeyPath)) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM" -Name "Service" -Force
}

# Define the registry value name and its data
$regValueName = "AllowBasic"
$regValueData = 0 # Setting AllowBasic to 0 (disabled)

# Set the registry value with REG_DWORD type
Set-ItemProperty -Path $regKeyPath -Name $regValueName -Value $regValueData

Write-Host "Registry value '$regValueName' set to $regValueData at $regKeyPath"
