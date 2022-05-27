## Surface Duo Drivers BSP - Version 2205.87
**Released:** 5/27/2022 11:00 PM UTC+2

**Quality:** Preview

![Surface Duo Dual Screen Windows](https://user-images.githubusercontent.com/3755345/170788230-a42e624a-d2ed-4070-b289-a9b34774bcd0.png)

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

- Addressed an issue where panels would not properly go to sleep/wake up from sleep (UEFI)
- Addressed an issue with secondary panel power on sequence (UEFI)
- Updated USB stack
- USB C is now 98% functional. Display out will not work yet through the USB C port. Plugging devices should now work regardless of if it's connected to a computer or a dongle or dock
- Some USB devices might still trigger some quirks with the current implementation, expect more polish in the coming week.
- USB Audio is still not functional
- You should now be able to browse your files on Duo when connected to a computer:

![image](https://pbs.twimg.com/media/FTxgb81WYAExQFT?format=jpg&name=large)

- You should now be able to change your device resolution for the left panel (right coming soon!) (UEFI)

![image](https://user-images.githubusercontent.com/3755345/170788826-8cab3577-9acc-4581-b38d-c9a1aad6f5f7.png)

- Merged both Duo A and Duo B packages into a single one, there's no need to know if your device is USA or EU anymore.

____________________________________________________________________________________________________________________________


Please note this is the beginning and barely anything will work currently.

What works and what matters from an user point of view:

- Side buttons
- USB
- Closing/Opening the device correctly puts it in sleep/awake
- CPU frequency is working
- Bluetooth
- GPU
- Both displays
- Touch
- Pen on the left screen
- Vibration motor
- Setting beans as wallpaper

Nothing else works! You have been warned

____________________________________________________________________________________________________________________________


How to offline update an existing Windows Desktop installation

- Switch the device into mass storage.
- Take note of the drive letter the Windows partition is using, here we will assume it got mounted as I:

- Download [SurfaceDuo-Drivers-Full.zip] from https://github.com/WOA-Project/SurfaceDuo-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility from https://github.com/WOA-Project/DriverUpdater/releases/latest
- Open a command prompt as administrator, where the driver utility got downloaded

- Execute the following command:
  
  DriverUpdater.exe -d C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\definitions\Desktop\ARM64\Internal\epsilon.txt -r C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\ -p I:\

- Reboot the device, the device will now begin PnP setup once again, and hopefully you will be back soon enough to your desktop

____________________________________________________________________________________________________________________________


How to install Windows Desktop on internal Storage

- Please follow the steps detailed at https://github.com/WOA-Project/SurfaceDuo-Guides

____________________________________________________________________________________________________________________________


### Bug reporting

This release is a Preview release. Bug exists and may happen. If you notice a bug not present in the following bug list, please report them on our Telegram Group.

-- WOA-Project Team