@echo off

for /f %%f in ('dir /b /s \Windows\OEM\Setup\OOBE\*.cmd') do (
    cmd.exe /c %%f
)