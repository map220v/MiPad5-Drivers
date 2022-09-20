
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

# Bugs
- Display (WIP. after display shutdown it's stays off until reboot)
- Bluetooth (can't access uart or something (Failed to open FDO I/O target, error:c0000001))