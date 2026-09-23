# Permissions README

## Purpose

This project uses Python, Git, MkDocs and Claude Code automation.  
Windows may repeatedly ask for permission when executing Python.exe or Git.exe,
which interrupts Claude Code operations such as:

- creating virtual environments  
- installing MkDocs and plugins  
- running mkdocs build/serve/deploy  
- executing git init / add / commit / push  

To eliminate these interruptions, this project includes a PowerShell script:

**`fix-permissions.ps1`**

It applies system-level permissions that allow Python and Git to run without
Windows Defender or SmartScreen prompts.

---

## What the script does

The script performs the following actions:

1. **Sets PowerShell ExecutionPolicy to `RemoteSigned`**  
   Allows local scripts to run without confirmation.

2. **Adds Windows Defender exclusions for:**
   - python.exe  
   - git.exe  
   - Python installation directories  
   - Git installation directories  

3. **Disables SmartScreen PUA protection**  
   Prevents “unrecognized app” warnings for Python/Git processes.

These changes ensure that Claude Code can execute commands smoothly.

---

## Usage

Run the script once with administrator privileges:

```powershell
powershell -ExecutionPolicy Bypass -File .\fix-permissions.ps1
