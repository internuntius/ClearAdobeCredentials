<#
.SYNOPSIS
ClearAdobeCredentials is a PowerShell function designed to identify and remove "Adobe App" credentials from the Windows Credential Manager.

.DESCRIPTION
This function lists all credentials stored in the Windows Credential Manager and filters out those that match "Adobe App". 
It then prompts the user to confirm the deletion of these credentials, displaying them if requested.

.PARAMETER None
This script does not accept any parameters.

.EXAMPLE
ClearAdobeCredentials

This will prompt the user to delete any "Adobe App" credentials found in the Credential Manager.

.NOTES
- This script only deletes credentials that match "Adobe App". "Adobe User" credentials are not affected.
- The script provides an option to view the credentials before deletion and allows the user to cancel the operation if desired.
- The function is added to your PowerShell session with the alias `clear_adobe_credentials`.
- This script is meant to be added to the user's PowerShell profile for easy access in future sessions.

#>

function ClearAdobeCredentials {
    # Retrieve and parse all credentials from cmdkey
    $output = & cmdkey /list
    $credentials = @()
    $currentCred = $null

    foreach ($line in $output) {
        # Match and extract the Target name
        if ($line -match '^\s*Target:\s*(.+)') {
            if ($currentCred) {
                $credentials += $currentCred
            }
            $currentCred = @{Target = $matches[1].Trim()}
        }
        # Match and extract the Type of the credential
        elseif ($line -match '^\s*Type:\s*(.+)' -and $currentCred) {
            $currentCred.Type = $matches[1].Trim()
        }
    }

    # Add the last credential if exists
    if ($currentCred) {
        $credentials += $currentCred
    }

    # Filter credentials to include only those related to "Adobe App"
    $adobeAppCredentials = $credentials | Where-Object { $_.Target -like "*Adobe App*" }
    $totalCount = $adobeAppCredentials.Count

    if ($totalCount -eq 0) {
        Write-Host "No Adobe App credentials found." -ForegroundColor Cyan
        return
    }

    Write-Host "Found $totalCount Adobe App credential(s)." -ForegroundColor Cyan

    # Function to display the Adobe App credentials
    function ShowCredentials {
        Write-Host "Adobe App credentials:" -ForegroundColor Yellow
        foreach ($cred in $adobeAppCredentials) {
            Write-Host "  $($cred.Target)" -ForegroundColor Cyan
        }
    }

    # User confirmation loop
    while ($true) {
        $confirmation = Read-Host "Do you want to proceed with deleting these credentials? (Y/N/S to Show)"
        if ($confirmation -eq 'Y') {
            break
        } elseif ($confirmation -eq 'N') {
            Write-Host "Operation cancelled by user." -ForegroundColor Yellow
            return
        } elseif ($confirmation -eq 'S') {
            ShowCredentials
        } else {
            Write-Host "Invalid input. Please enter Y, N, or S." -ForegroundColor Red
        }
    }

    # Track the number of successfully deleted credentials
    $deletedCount = 0

    foreach ($cred in $adobeAppCredentials) {
        Write-Host "Attempting to delete credential: $($cred.Target)" -ForegroundColor Yellow

        try {
            # Attempt to delete the credential using cmdkey
            $result = Start-Process "cmdkey.exe" -ArgumentList "/delete:`"$($cred.Target)`"" -Wait -NoNewWindow -PassThru
            if ($result.ExitCode -eq 0) {
                Write-Host "Successfully deleted credential: $($cred.Target)" -ForegroundColor Green
                $deletedCount++
            } else {
                Write-Host "Failed to delete credential: $($cred.Target). Exit code: $($result.ExitCode)" -ForegroundColor Red
            }
        } catch {
            Write-Host "An error occurred while trying to delete credential: $($cred.Target). Error: $_" -ForegroundColor Red
        }
    }

    Write-Host "Successfully deleted $deletedCount out of $totalCount Adobe App credential(s)." -ForegroundColor Cyan
}

# Create an alias for easier access
New-Alias -Name clear_adobe_credentials -Value ClearAdobeCredentials -Force -Option AllScope
