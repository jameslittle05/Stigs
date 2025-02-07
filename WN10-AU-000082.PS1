<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 must be configured to audit Object Access - File Share successes.

.NOTES
    Author          : James Little
    LinkedIn        : 
    GitHub          : github.com/jameslittle05
    Date Created    : 2025-02-07
    Last Modified   : 2025-02-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000082

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000082).ps1 
#>


# Get the current Audit Policy settings
$auditPolicy = auditpol /get /category:"Object Access" /r | Where-Object {$_ -match "File Share"}

# Check if "Audit File Share" contains "Success"
if ($auditPolicy -match "Success") {
    Write-Host "Audit File Share is correctly configured with 'Success'." -ForegroundColor Green
} else {
    Write-Host "Audit File Share is not correctly configured. Applying fix..." -ForegroundColor Yellow

    # Set "Audit File Share" to Success
    auditpol /set /subcategory:"File Share" /success:enable

    # Verify the change
    $auditPolicyUpdated = auditpol /get /category:"Object Access" /r | Where-Object {$_ -match "File Share"}
    
    if ($auditPolicyUpdated -match "Success") {
        Write-Host "Audit File Share has been successfully configured to 'Success'." -ForegroundColor Green
    } else {
        Write-Host "Failed to apply the correct settings. Please check manually." -ForegroundColor Red
    }
}
