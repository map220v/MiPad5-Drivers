## Surface Duo Drivers BSP - Version 2205.70
**Released:** 5/22/2022 09:00 PM UTC+2

**Quality:** Preview

### Compatibility

| Operating System                                                          | Supported? |
|---------------------------------------------------------------------------|------------|
| Windows 10 Build 16299 (1709)                                             | ❌         |
| Windows 10 Build 17134 (1803)                                             | ❌         |
| Windows 10 Build 17763 (1809)                                             | ❌         |
| Windows 10 Build 18362 (1903)                                             | ⚠️         |
| Windows 10 Build 18363 (1909)                                             | ⚠️         |
| Windows 10 Build 19041 (2004)                                             | ✅         |
| Windows 10 Build 19042 (20h2)                                             | ✅         |
| Windows 10 Build 19043 (21h1)                                             | ✅         |
| Windows 10 Build 19044 (21h2)                                             | ✅         |
| Windows 11 Build 22000 (21h2)                                             | ✅         |
| Windows 11 Build 22621 (22h2)                                             | ✅         |
| Windows 11 vNext (Copper Semester)                                        | ✅         |


❌: Not supported, important issues present

⚠️: Not supported, minor issues present, not actively maintained anymore

✅: Fully supported, known issues present but nothing impactful, actively maintained

### Release notes

____________________________________________________________________________________________________________________________

Important information

- IMPORTANT: THIS VERSION REQUIRES AN UEFI UPDATE! DO NOT USE WITH OLDER UEFIs!
- It is expected currently for the boot process to look very rough on the right panel, when the image will change on the left the panel will act normally. This is the beginning, so bear with us for now :) Your displays aren't broken, and won't get damaged.
- It is also expected for some rendering glitches to happen right now, do not freak out, it's not going to damage anything, your gpu isn't dying, it's ok. Here's an example of a glitch you may be expecting:

![image](https://user-images.githubusercontent.com/3755345/166138815-bdc8d4f4-151b-4d37-aa7a-d68f75c259ce.png)

Changelog

- Hardware Haptics/Vibration motor is now functional. Applications using the Windows Haptics api will be able to use it and adjust its intensity
- Vibration support for notifications is now available
- New Surface Settings application to adjust USB settings, vibration settings, and view information
- The touch keyboard should now automatically show up on new installations with no keyboard connected

____________________________________________________________________________________________________________________________


Please note this is the beginning and barely anything will work currently.

What works and what matters from an user point of view:

- Side buttons
- USB (needs a registry change)
- Closing/Opening the device correctly puts it in sleep/awake
- CPU frequency is working
- Bluetooth
- GPU
- Both displays
- Touch
- Pen on the left screen
- Vibration motor

Nothing else works! You have been warned

____________________________________________________________________________________________________________________________


How to offline update an existing Windows Desktop installation

- Switch the device into mass storage.
- Take note of the drive letter the Windows partition is using, here we will assume it got mounted as I:

- Download [SurfaceDuo-Drivers-Full.zip] from https://github.com/WOA-Project/SurfaceDuo-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility from https://github.com/WOA-Project/DriverUpdater/releases/latest
- Open a command prompt as administrator, where the driver utility got downloaded

- If your device is an EU device, execute the following command:
  
  DriverUpdater.exe -d C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\definitions\Desktop\ARM64\Internal\epsilon_eu.txt -r C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\ -p I:\

- If your device is an USA device, execute the following command:
  
  DriverUpdater.exe -d C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\definitions\Desktop\ARM64\Internal\epsilon_gen.txt -r C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\ -p I:\

- Reboot the device, the device will now begin PnP setup once again, and hopefully you will be back soon enough to your desktop

____________________________________________________________________________________________________________________________


How to install Windows Desktop on internal Storage

- Please follow the steps detailed at https://github.com/WOA-Project/SurfaceDuo-Guides

____________________________________________________________________________________________________________________________


### Bug reporting

This release is a Preview release. Bug exists and may happen. If you notice a bug not present in the following bug list, please report them on our Telegram Group.

-- WOA-Project Team