<#
.SYNOPSIS
    This PowerShell script ensures that Users must be notified if a web-based program attempts to install software.

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2025-02-07
    Last Modified   : 2025-02-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000320

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000320).ps1 
#>



# Define the registry path and value name
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$valueName = "SafeForScripting"
$expectedValue = 0

# Check if the registry key exists
if (!(Test-Path $registryPath)) {
    Write-Host "Registry path does not exist. Creating the required registry path..." -ForegroundColor Yellow
    New-Item -Path $registryPath -Force | Out-Null
}

# Check if the value exists
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue

if ($currentValue -and $currentValue.$valueName -eq $expectedValue) {
    Write-Host "SafeForScripting is correctly set to 0." -ForegroundColor Green
} else {
    Write-Host "SafeForScripting is either missing or incorrectly set. Applying fix..." -ForegroundColor Yellow

    # Set the registry value to 0
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $expectedValue -Type DWord

    # Verify the change
    $updatedValue = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue
    if ($updatedValue -and $updatedValue.$valueName -eq $expectedValue) {
        Write-Host "SafeForScripting has been successfully set to 0." -ForegroundColor Green
    } else {
        Write-Host "Failed to apply the correct settings. Please check manually." -ForegroundColor Red
    }
}
