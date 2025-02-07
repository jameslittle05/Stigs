<#
.SYNOPSIS
    This PowerShell script ensures that Windows Telemetry is not configured to Full.


.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2024-02-05
    Last Modified   : 2024-02-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000205

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000205).ps1 
#>

# Define registry path and parameters
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$valueName = "AllowTelemetry"
$valueType = "DWord"

# Define allowed values based on Windows 10 version and policy needs
$allowedValues = @(0, 1, 2)  # 0 = Security, 1 = Basic, 2 = Enhanced (if needed for Windows Analytics)

# Set the desired value (modify as needed: 0 for Security, 1 for Basic, 2 for Enhanced)
$desiredValue = 0  # Change to 1 or 2 if required for policy compliance

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value only if it matches an allowed configuration
if ($allowedValues -contains $desiredValue) {
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $desiredValue -Type $valueType
    Write-Output "Registry value '$valueName' set to $desiredValue."
} else {
    Write-Output "Error: Desired value $desiredValue is not within the allowed configurations: $($allowedValues -join ', ')."
}

# Verify the change
$updatedValue = Get-ItemProperty -Path $registryPath -Name $valueName
Write-Output "Current AllowTelemetry value: $($updatedValue.$valueName)"
