## Surface Duo Drivers BSP - Version 2312.29 (Theta)

<details>
  <summary>General information</summary>
  <p>
**Released:** 12/10/2023 08:00 PM UTC+1

**Quality:** Preview

You can view compatibility for this release, along with important information and what works, and what doesn't at this link: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Status.md
  </p>
</details>

<details>
  <summary>Important information</summary>
  <p>
- ⚠️ This version of the drivers needs to be paired with UEFI version greater than or equal to 2312.29.

- ⚠️ For users who are updating from an earlier release than version 2301.93, please reinstall.

- ⚠️ If you need dual boot, you will have to make your own image. Please follow this guidance: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/DualBoot.md

- ⚠️ You need to backup your original boot image for OTAs to work with Android. When you get an OTA, you will want to revert your boot image for the update to work, or you'll have to use an official OTA recovery package.
  </p>
</details>

---

[▶️ Install Surface Duo (1st Gen) UEFI and Drivers for Windows from scratch (Clean Installation)](https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/InstallWindows/InstallWindows-SurfaceDuo1.md)

[▶️ Install Surface Duo 2 UEFI and Drivers for Windows from scratch (Clean Installation)](https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/InstallWindows/InstallWindows-SurfaceDuo2.md)

[▶️ Update from an older version of Surface Duo UEFI and Drivers (both got updated with v2312.29)](https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Update/UpdateDriversAndUEFI.md)

---

### Release notes

What's new?

- **_New!_**: You can now install drivers offline more easily, simply run "OfflineUpdater.cmd" at the root of the zip archive you downloaded, and follow instructions

- **_New!_**: You can now install drivers online! In other words, you can update the drivers on the device itself, while the OS is running. Currently this is work in progress and only supported if you have secure boot off (which normally is not the case). To update your drivers online within the os, simply run "OnlineUpdater.cmd" at the root of the zip archive you downloaded, and follow instructions

- **_New!_**: We added better application installation support

- **_New!_**: We now provide the matching version of driver updater so you can install the release more easily

#### Surface Duo (1st Gen)

What's new?

- **_New!_**: We updated the audio calibration board configuration files. For now, you will notice audio is not yet enabled due to SPKR issues, we hope to bring this in next week for the anniversary release

- **_New!_**: We updated the fingerprint sensor driver. The driver is now 100% functional with _Secure Boot disabled_. We will try to find a way out of this caveat for the next release.

- **_New!_**: We improved the installation process to be faster and not depend on extra install steps online. This should result in less errors and more reliability.

- **_New!_**: We updated most Qualcomm Drivers to their latest version (v2040)

- **_New!_**: We added support for additional Surface Docking Accessories (Surface Audio Dock) by default

- **_New!_**: We updated all Surface Drivers to their latest version when applicable

- **_New!_**: We introduced a prerelease driver for Surface Dial support. Support remains disabled in this release.

- **_New!_**: We introduced touch support for Redstone 5 and earlier Windows Versions.

__New!__: We are now providing smaller download packages, specifically tailored towards a given device and OS target.

- Please download ```SurfaceDuo-Drivers-v2312.29-Desktop-Epsilon.zip``` if you want drivers for Surface Duo 1
- Please download ```SurfaceDuo-Drivers-v2312.29-Desktop-Zeta.zip``` if you want drivers for Surface Duo 2

<details>
  <summary>Known issues</summary>
  <p>
- Installing Gallium Semester Insider builds may lead to a black screen on second boot of the OS, simply press the power button to continue.

- Booting Windows 10 18362/18363 will lead to "static screen" effects on the right display, much like driver releases from last year did on any version of Windows. A fix is being worked on for the next release.

- The TPM driver is not working for Windows 10 18362/18363. A fix is being worked on for the next release.

- The Posture driver is not working for Windows 10 18362/18363. A fix is being worked on for the next release.

- Enhanced auto rotation is not working for Windows 10 18362/18363. A fix is being worked on for the next release.

- Brightness control is glitchy on both displays.

- On device speakers are not functional.

- Dongles are not detected correctly when plugged into the USB Type-C port.

- Updating drivers may lead to weird configurations if done on old driver releases.

- MAC addresses do not reflect the real addresses asigned to the device.

- BitLocker drive encryption is not available.

- USB dongles that are not externally powered may not currently work.

- USB-C Billboard devices will not currently work.

- External Display Stream support will not currently work.

- Additional information provided by the posture sensor is currently not available for public consumption. This includes peek events.

- Digitizers will not react to the device being folded over.

- Displays will not react to the device being folded over most of the time.

- Physical device data is incorrect.

- Digitizers aren't calibrated correctly.

- Flipping the device is not smooth.

- Users upgrading from releases older than the January ones may want to clean install again.

- Booting Windows 10 18362/18363 with Secure Boot enabled is not currently supported and will result in a broken installation.

- In some cases, booting the UEFI image may lead to "static screen" effects on the left display. Please do not force reboot the device as it may interrupt the installation process, if ongoing, and instead please wait a few minutes.

- Windows Recovery environment lacks drivers unless Windows has performed a Feature Update at least once.

- sRGB is not available currently, and displays will not react to ICC profiles being applied.
  </p>
</details>


#### Surface Duo 2

What's new?

- Surface Duo 2 is still a Proof of Concept (PoC), don't expect much.

---

<details>
  <summary>Accessing Foldable Sensors from your applications</summary>
  <p>
In order to currently access the sensor data given by the foldable sensors, you need to use the following apis:


- Windows.Devices.Sensors.HingeAngleSensor*
- Windows.Internal.Devices.Sensors.FlipSensor* (2)
- Windows.Internal.System.TwoPanelHingePostureDevice* (2)


(2): These apis require the use of an externally sourced winmd available from https://github.com/ADeltaX/InternalWinMD/blob/master/%23winmd/Windows.Internal.Devices.Sensors.winmd


In the future, further apis will be functional (specifically under the Windows.System.Preview namespace). Consider this an early "thing".


The following API may be used to determine if your app is used on a dual screen device: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.windowingenvironment.getdisplayregions?view=winrt-22621

The following API may be used to determine on which display region your app is currently being shown: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.getdisplayregions?view=winrt-22621

The following API may be used to move your application to the other display: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.requestmoverelativetodisplayregion?view=winrt-22621

THe following API may be used to move your application to a specific display: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.requestmovetodisplayregion?view=winrt-22621

The following API may be used for spanning purposes: https://docs.microsoft.com/en-us/uwp/api/windows.ui.windowmanagement.appwindow.requestsize?view=winrt-22621

The Windowing Environment for Windows Desktop editions (outside of tablet mode) is Overlapped. Tiled is used for Tablet Mode and Windows Core OS's ModernPC.


### Code Samples

```cpp
#include <iostream>
#include <windows.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Internal.Devices.Sensors.h>
#include <winrt/Windows.Internal.System.h>
#include <winrt/Windows.System.Preview.h>
#include <winrt/Windows.UI.WindowManagement.h>
#include <winrt/Windows.Foundation.Collections.h>

using namespace std;
using namespace winrt;
using namespace Windows::Foundation;
using namespace Windows::Internal::Devices::Sensors;
using namespace Windows::Internal::System;
using namespace Windows::System::Preview;
using namespace Windows::UI::WindowManagement;
using namespace Windows::Foundation::Collections;

VOID OnFoldSensorReadingChanged(FoldSensor const&, FoldSensorReadingChangedEventArgs const& args)
{
	try {
		printf("Fold sensor state changed.\n");
		switch (args.Reading().GestureState())
		{
		case GestureState::Started:
			std::cout << "Fold started\n" << std::endl;
			break;
		case GestureState::Completed:
			std::cout << "Fold stopped\n" << std::endl;
			break;
		case GestureState::Cancelled:
			std::cout << "Fold cancelled\n" << std::endl;
			break;
		case GestureState::Unknown:
			std::cout << "Fold unknown\n" << std::endl;
			break;
		}

		for (auto panel : args.Reading().ContributingPanel())
		{
			printf("Panel: %s\n", to_string(panel).c_str());
		}
		
		std::cout << "Initial angle " << args.Reading().InitialAngle() << std::endl;
		std::cout << "Final angle " << args.Reading().FinalAngle() << std::endl;
		
		switch (args.Reading().FoldType())
		{
		case FoldType::Closing:
			std::cout << "Fold Closing\n" << std::endl;
			break;
		case FoldType::Opening:
			std::cout << "Fold Opening\n" << std::endl;
			break;
		case FoldType::NotDetected:
			std::cout << "Fold NotDetected\n" << std::endl;
			break;
		}
	}
	catch (...) {}
}

VOID PrintDetails(TwoPanelHingedDevicePostureReading const& args)
{
	try {
		std::cout << "Panel1 " << args.Panel1Id().c_str() << "\n" << std::endl;
		std::cout << "Panel2 " << args.Panel2Id().c_str() << "\n" << std::endl;

		std::cout << "Panel1 Orientation " << (int)args.Panel1Orientation() << "\n" << std::endl;
		std::cout << "Panel2 Orientation " << (int)args.Panel2Orientation() << "\n" << std::endl;

		switch (args.HingeState())
		{
		case Windows::Internal::System::HingeState::Unknown:
			std::cout << "Hinge1State Unknown\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Closed:
			std::cout << "Hinge1State Closed\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Concave:
			std::cout << "Hinge1State Concave\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Flat:
			std::cout << "Hinge1State Flat\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Convex:
			std::cout << "Hinge1State Convex\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Full:
			std::cout << "Hinge1State Full\n" << std::endl;
			break;
		}
	}
	catch (...) {}
}

VOID OnPostureChanged(TwoPanelHingedDevicePosture const&, TwoPanelHingedDevicePostureReadingChangedEventArgs const& args)
{
	try {
		printf("Posture sensor state changed.\n");
		PrintDetails(args.Reading());
	}
	catch (...) {}
}

VOID OnSensorReadingChanged(FlipSensor const&, FlipSensorReadingChangedEventArgs const& args)
{
	try {
		printf("Flip sensor state changed.\n");
		switch (args.Reading().GestureState())
		{
		case GestureState::Started:
			std::cout << "Flip started\n" << std::endl;
			break;
		case GestureState::Completed:
			std::cout << "Flip stopped\n" << std::endl;
			break;
		case GestureState::Cancelled:
			std::cout << "Flip cancelled\n" << std::endl;
			break;
		case GestureState::Unknown:
			std::cout << "Flip unknown\n" << std::endl;
			break;
		}
	}
	catch (...) {}
}

int main()
{
    init_apartment();
	printf("Trying to get flip sensor.\n");
	try {
		FlipSensor flip = FlipSensor::GetDefaultAsync().get();
		if (flip == nullptr)
		{
			printf("Flip sensor not found.\n");
		}
		else
		{
			printf("Starting listening session for flip sensor.\n");
			flip.ReadingChanged(OnSensorReadingChanged);
		}
		printf("Press any key to stop\n");
		std::cin.get();
	}
	catch (...) {}

	printf("Trying to get posture sensor.\n");
	try {
		TwoPanelHingedDevicePosture Posture = TwoPanelHingedDevicePosture::GetDefaultAsync().get();
		if (Posture == nullptr)
		{
			printf("Posture sensor not found.\n");
		}
		else
		{
			auto curpst = Posture.GetCurrentPostureAsync().get();
			if (curpst != nullptr)
			{
				PrintDetails(curpst);
			}
			printf("Starting listening session for Posture sensor.\n");
			Posture.PostureChanged(OnPostureChanged);
		}
		printf("Press any key to stop\n");
		std::cin.get();
	}
	catch (...) {}

	printf("Trying to get fold sensor.\n");
	try {
		FoldSensor fold = FoldSensor::GetDefaultAsync().get();
		if (fold == nullptr)
		{
			printf("Fold sensor not found.\n");
		}
		else
		{
			printf("Starting listening session for fold sensor.\n");
			fold.ReadingChanged(OnFoldSensorReadingChanged);
		}
		printf("Press any key to stop\n");
		std::cin.get();
	}
	catch (...) {}
}
```
  </p>
</details>

<details>
  <summary>How to offline update an existing Windows Desktop installation</summary>
  <p>
- Switch the device into mass storage.
- Take note of the drive letter the Windows partition is using, here we will assume it got mounted as I:

- Download [SurfaceDuo-Drivers-Full.zip] from https://github.com/WOA-Project/SurfaceDuo-Drivers/releases/latest
- Extract said zip file to a folder of your choice, we will assume here we extracted it to C:\UpdatedDrivers
- Download the DriverUpdater utility from https://github.com/WOA-Project/DriverUpdater/releases/latest
- Open a command prompt as administrator, where the driver utility got downloaded

- Execute the following command:
  
  DriverUpdater.exe -d C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\definitions\Desktop\ARM64\Internal\epsilon.txt -r C:\UpdatedDrivers\SurfaceDuo-Drivers-XXXX\ -p I:\

- Reboot the device, the device will now begin PnP setup once again, and hopefully you will be back soon enough to your desktop
  </p>
</details>

<details>
  <summary>How to install Windows Desktop on internal Storage</summary>
  <p>
Please follow the steps detailed at https://github.com/WOA-Project/SurfaceDuo-Guides
  </p>
</details>

<details>
  <summary>Bug reporting</summary>
  <p>
This release is a Preview release. Bug exists and may happen. If you notice a bug not present in the following bug list, please report them on our Telegram Group.
  </p>
</details>

---

Seems Faster(TM)

-- The DuoWoA authors
