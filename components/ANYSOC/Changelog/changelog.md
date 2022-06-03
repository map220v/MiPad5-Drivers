## Surface Duo Drivers BSP - Version 2206.10
**Released:** 6/03/2022 10:00 PM UTC+2

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

<details>

![image](https://user-images.githubusercontent.com/3755345/166138815-bdc8d4f4-151b-4d37-aa7a-d68f75c259ce.png)

</details>

Changelog

- Addressed an issue with USB controller configuration when switching to USB function mode (UEFI)
- Addressed an issue with Camera sensor regulators not being enabled (UEFI)
- Addressed an issue with Modern Standby impacting system stability during sleep (UEFI)

![I got the power! (Both batteries working under Windows)](https://user-images.githubusercontent.com/3755345/171932587-804377fa-7b99-45d8-a760-8b3c10bd4bc0.png)

- NEW: You can now monitor your battery(ies) level from Windows! Reporting for both batteries is enabled as part of this release.
  Compared to android, the following differences are present:
-- You can check your battery packs individually
-- You are able to check the cycle count of each battery pack
-- You are able to check the serial number of each battery pack, as well as the manufacturer
-- [Coming Soon] You will soon be able to check the manufacturing date of each battery pack
-- You are able to check how worn out your batteries are
- NEW: Windows will now shutdown once batteries reach 5% charge
- NOTE: This release does not allow you to charge under Windows yet.
- NEW: New users will start with the displays properly configured in extended mode, in the right position, and in the right order

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
- Both Batteries (no charging)

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
