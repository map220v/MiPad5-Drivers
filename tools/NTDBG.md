# Debugging Windows on SM8150 Devices

## Requirements:

- UEFI complicant firmware
- SecureBoot off in the UEFI firmware
- ACPI 5.0 compliant firmware
- Windows installed on the UFS
- EFI ESP partition already provisioned
- Windows Host Computer
- WinDBG (WinDBG X/WinDBG Preview from the store will do just fine)
- USB cable
- USB support in the UEFI firmware (Windows will use said UEFI's USB protocol for debugging)

## Steps:

- Mount your phone ESP partition (we will assume here it's ```X:```)
- ```cd /d X:\EFI\Microsoft\Boot\```
- ```bcdedit /store BCD /dbgsettings NET BUSPARAMS:1 KEY:1.2.3.4 HOSTIP:169.254.255.255 PORT:50000 NODHCP```
- ```bcdedit /store BCD /set {default} debug on```

# Debugging ACPI issues

- On initial break: ```bp ACPI!DriverEntry;g;g```
- ```!amli set verboseon spewnon traceon```
- ```g```

- On failure: ```!amli r```
