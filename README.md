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
   ```

### 3. Follow the Prompts:
   - The script will:
     - Download the `ClearAdobeCredentials` function.
     - Display the function's content for your review.
     - Prompt you to confirm whether you want to add the function to your PowerShell profile.
   - **Important:** The script automatically handles the installation process. You don’t need to manually run any additional commands after this step.

## How to Run the `ClearAdobeCredentials` Function

### 1. Open PowerShell:
   - If you’ve just installed the function, it’s already available in your current session. If you’ve restarted PowerShell, the function will still be available.

### 2. Run the Function:
   - To manage your Adobe credentials, type the following command in your PowerShell window and press Enter:
   ```powershell
   ClearAdobeCredentials
   ```

### 3. Follow the Prompts:
   - The function will:
     - Scan your Windows Credential Manager for "Adobe App" credentials.
     - Display the number of "Adobe App" credentials found.
     - Prompt you to confirm whether you want to delete these credentials.
     - Allow you to view the credentials before deletion if desired.

### 4. Review and Confirm Deletion:
   - You will have the option to:
     - Proceed with deletion (`Y` for Yes).
     - Cancel the operation (`N` for No).
     - View the credentials (`S` to Show) before deciding.

### 5. Complete the Process:
   - After confirming, the function will delete the selected credentials and provide a summary of the actions taken.

### 6. Use in Future Sessions:
   - The `ClearAdobeCredentials` function is now a permanent part of your PowerShell profile, meaning you can run it at any time by opening PowerShell and typing `ClearAdobeCredentials`.

## Important Notes

### 1. **Profile Modification:**
   - Adding the script to your PowerShell profile means it will automatically be available every time you start a new PowerShell session. This ensures that the function is always ready for use without needing to reinstall it.

### 2. **Script Transparency:**
   - The script content is fully displayed before any changes are made to your system. This transparency allows you to review and understand the code, ensuring there are no surprises.

### 3. **Backup Creation:**
   - Before adding the function to your profile, the script creates a backup of your existing PowerShell profile. This backup ensures that you can easily restore your previous configuration if needed.

### 4. **What It Deletes:**
   - The script specifically targets and deletes credentials labeled as "Adobe App" in the Windows Credential Manager.
   - **Important:** The script does not delete "Adobe User" credentials, which are typically used for logging into Adobe applications. This ensures you won’t lose access to your Adobe accounts.

### 5. **Non-Destructive Nature:**
   - The script only deletes the credentials you confirm for deletion, and it does so safely by first displaying the credentials it found and asking for your confirmation before proceeding.

### 6. **Security Assurance:**
   - The script is hosted on GitHub, where you can review the source code at any time. This transparency ensures that there are no hidden actions or malicious intent. You are encouraged to review the code directly from GitHub.

## Troubleshooting

- **If the script fails to download:**
  - Ensure that you have an active internet connection.
  - Verify that you have copied the command correctly, including the URL.

- **If you encounter issues after installation:**
  - You can revert to your previous PowerShell profile by restoring from the backup created by the script.

## Additional Information

- **Version:** 1.0
- **Author:** Bryant Avey
- **Repository:** https://github.com/internuntius/ClearAdobeCredentials
- **License:** MIT License

By following these instructions, you can safely install and use the `ClearAdobeCredentials` function to manage your Adobe-related credentials in the Windows Credential Manager. This tool is designed with transparency and user control in mind, ensuring a smooth and safe experience.