$scriptUrl = "https://raw.githubusercontent.com/your-repo/your-script.ps1"
$scriptContent = (Invoke-WebRequest -Uri $scriptUrl).Content

# Display the script content to the user
Write-Host "Script content:" -ForegroundColor Cyan
Write-Host $scriptContent

# Ask for user confirmation to add the script to the profile
$confirmation = Read-Host "Do you want to add this script to your PowerShell profile? (Y/N)"
if ($confirmation -eq 'Y') {
    Add-Content -Path $PROFILE -Value $scriptContent
    Write-Host "Script added to your PowerShell profile." -ForegroundColor Green
    Write-Host "To use it in future sessions, restart PowerShell or run '. `$PROFILE'" -ForegroundColor Yellow
}

# Execute the script immediately in the current session
. ([ScriptBlock]::Create($scriptContent))
Write-Host "Script is now available for use in this session." -ForegroundColor Green
