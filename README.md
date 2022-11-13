
# Windows Driver pack for Mi Pad 5 platforms

Pirate Drivers of [SurfaceDuo-Drivers](https://github.com/WOA-Project/SurfaceDuo-Drivers) ! ! !

Check Copyright, License, Disclaimers and end user license agreement [Here](https://github.com/WOA-Project/SurfaceDuo-Drivers/blob/main/README.md) 

Commercial use is PROHIBITED

# Driver Installation

[DriverUpdater](https://github.com/WOA-Project/DriverUpdater/releases/)

```
cd MiPad5-Drivers
.\DriverUpdater.exe -d .\definitions\Desktop\ARM64\Internal\nabu.txt -r ./ -p D:\
```

Change "D:\" to disk where windows arm64 installed

# Optional
For sensors to work, follow this: [Copy over calibration files/configuration files for the sensors](https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/InstallWindows-SurfaceDuo1.md#temporary-and-optional-copy-over-calibration-filesconfiguration-files-for-the-sensors)

# Bugs
- Display (WIP. after display shutdown it's stays off until reboot)