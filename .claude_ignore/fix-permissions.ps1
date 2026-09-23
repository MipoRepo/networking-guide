# ============================================================
# fix-permissions.ps1
# Purpose: Remove Windows permission prompts for Python & Git
# Author: Mikko Pohjola
# ============================================================

Write-Host "Applying execution and Defender permissions..." -ForegroundColor Cyan

# 1. Allow PowerShell script execution
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
Write-Host "ExecutionPolicy set to RemoteSigned."

# 2. Add Defender exclusions for Python
Add-MpPreference -ExclusionProcess "python.exe"
Add-MpPreference -ExclusionPath "C:\Users\$env:USERNAME\AppData\Local\Programs\Python"
Add-MpPreference -ExclusionPath "C:\Users\$env:USERNAME\AppData\Local\Programs\Python\Python311"
Add-MpPreference -ExclusionPath "C:\Users\$env:USERNAME\AppData\Local\Programs\Python\Python311\Scripts"
Write-Host "Python exclusions added."

# 3. Add Defender exclusions for Git
Add-MpPreference -ExclusionProcess "git.exe"
Add-MpPreference -ExclusionPath "C:\Program Files\Git"
Add-MpPreference -ExclusionPath "C:\Program Files\Git\bin"
Add-MpPreference -ExclusionPath "C:\Program Files\Git\cmd"
Write-Host "Git exclusions added."

# 4. Disable SmartScreen PUA protection (optional but recommended)
Set-MpPreference -PUAProtection 0
Write-Host "SmartScreen PUA protection disabled."

Write-Host "All permissions applied successfully." -ForegroundColor Green
