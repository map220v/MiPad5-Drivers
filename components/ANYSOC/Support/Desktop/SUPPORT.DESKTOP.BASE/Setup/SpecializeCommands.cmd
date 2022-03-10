@echo off

for /f %%f in ('dir /b /s \Windows\OEM\Setup\Specialize\*.cmd') do (
    cmd.exe /c %%f
)