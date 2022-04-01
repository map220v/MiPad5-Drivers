set EFIESP=I:
set MainOS=J:
set VIRT_EFIESP=K:

bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootdebugpolicy   No
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootorderclean    No
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enabledeviceid          No
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablemassstorage       No
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablerpmbprovisioning  No
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablesecurebootpolicy  No
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablestartcharge       No
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enableresettpm          No

bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {default} nointegritychecks       Yes
bcdedit /store %EFIESP%\efi\Microsoft\Boot\BCD /set {default} testsigning             Yes

bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootdebugpolicy   No
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablebootorderclean    No
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enabledeviceid          No
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablemassstorage       No
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablerpmbprovisioning  No
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablesecurebootpolicy  No
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enablestartcharge       No
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {01de5a27-8705-40db-bad6-96fa5187d4a6} enableresettpm          No

bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {default} nointegritychecks       Yes
bcdedit /store %VIRT_EFIESP%\efi\Microsoft\Boot\BCD /set {default} testsigning             Yes

ren %EFIESP%\efi\Microsoft\Boot\SecureBootPolicy.p7b SecureBootPolicy.p7b.bak

ren %VIRT_EFIESP%\efi\Microsoft\Boot\SecureBootPolicy.p7b SecureBootPolicy.p7b.bak

move %MainOS%\Windows\System32\EnableWcosUefiSbTest.exe %MainOS%\Windows\System32\EnableWcosUefiSbTest.disabled.exe

reg load HKLM\RTS %MainOS%\Windows\System32\config\SOFTWARE
for /f %%f in ('dir /b /s %Folder%\REG.EPSILON\SOFTWARE\*.reg') do reg import %%f
reg unload HKLM\RTS

reg load HKLM\RTS %MainOS%\Windows\System32\config\SYSTEM
for /f %%f in ('dir /b /s %Folder%\REG.EPSILON\SYSTEM\*.reg') do reg import %%f
reg add HKLM\RTS\ControlSet001\Services\bindflt /v Start /t REG_DWORD /d 0 /f
reg add HKLM\RTS\ControlSet001\Control\Bitlocker /v PreventDeviceEncryption /t REG_DWORD /d 1 /f
reg unload HKLM\RTS