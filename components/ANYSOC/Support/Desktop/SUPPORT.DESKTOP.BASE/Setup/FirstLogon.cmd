@echo off

reg add HKLM\Software\Policies\Microsoft\Windows\Appx /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1

\Windows\OEM\ApplicationProvisioner.exe

for /f %%f in ('dir /b /s \Windows\OEM\Setup\FirstLogon\*.cmd') do (
    cmd.exe /c %%f
)