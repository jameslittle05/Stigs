<#
.SYNOPSIS
    This PowerShell script ensures that the convenience PIN for Windows 10 must be disabled..

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2024-02-04
    Last Modified   : 2024-02-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000370).ps1 
#>

# Define registry path and value parameters
$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\System"
$ValueName = "AllowDomainPINLogon"
$ValueType = "DWORD"
$ValueData = 0

# Ensure the registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -Type $ValueType

# Confirm the change
Write-Output "Registry key $ValueName set to $ValueData at $RegPath"





# Define registry path and value parameters
$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\System"
$ValueName = "AllowDomainPINLogon"
$ValueType = "DWORD"
$ValueData = 0

# Ensure the registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -Type $ValueType

# Confirm the change
Write-Output "Registry key $ValueName set to $ValueData at $RegPath"
