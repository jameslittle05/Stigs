<#
.SYNOPSIS
    This PowerShell script ensures that Camera access from the lock screen is disabled.

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2024-02-03
    Last Modified   : 2024-02-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000005).ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the policy to disable camera access from the lock screen
Set-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -Type DWord -Value 1

# Force a Group Policy update
gpupdate /force

Write-Host "Camera access from the lock screen has been disabled (system-wide). A restart may be required for changes to take effect."
