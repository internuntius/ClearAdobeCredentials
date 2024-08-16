# ClearAdobeCredentials Function

The `ClearAdobeCredentials` function is designed to help you manage and clean up Adobe-related credentials stored in the Windows Credential Manager. This function specifically targets and removes "Adobe App" credentials, which are often created by Adobe software and can accumulate over time.

## What Does This Script Do?

### 1. **Downloads:**
   - The script retrieves the `ClearAdobeCredentials` function from a secure GitHub repository.

### 2. **Displays:**
   - Before making any changes, the script displays the full content of the `ClearAdobeCredentials` function in your PowerShell window. This allows you to review the code and understand exactly what it will do before proceeding.

### 3. **Installs:**
   - If you choose to proceed, the script will add the `ClearAdobeCredentials` function to your PowerShell profile. This means the function will be available every time you start a new PowerShell session, without needing to reinstall it.

### 4. **Runs:**
   - The script also immediately loads the `ClearAdobeCredentials` function into your current PowerShell session, allowing you to use it right away.

## Installation Steps

### 1. Open PowerShell:
   - Start PowerShell on your Windows machine. You can do this by searching for "PowerShell" in the Start menu.

### 2. Run the Installation Command:
   - Copy and paste the following command into your PowerShell window and press Enter:
   ```powershell
   iex "& { $(irm 'https://raw.githubusercontent.com/internuntius/ClearAdobeCredentials/main/InstallClearAdobeCredentials.ps1') }"