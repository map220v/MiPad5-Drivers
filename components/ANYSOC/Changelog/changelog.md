## Surface Duo Drivers BSP - Version 2406.36 (Ornithoptera alexandrae)

![A duo of Duos](https://github.com/WOA-Project/SurfaceDuo-Drivers/assets/3755345/5848583d-a569-480e-bfdc-74d569811a53)

<details>
  <summary>General information</summary>
  <p>
**Released:** 05/20/2024 11:00 PM UTC+2

**Quality:** Preview

You can view compatibility for this release, along with important information and what works, and what doesn't at this link: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Status.md
  </p>
</details>

<details>
  <summary>Important information</summary>
  <p>
- ⚠️ This version of the drivers needs to be paired with UEFI version greater than or equal to 2406.36.

- ⚠️ For users who are updating from an earlier release than version 2301.93, please reinstall.

- ⚠️ If you need dual boot, you will have to make your own image. Please follow this guidance: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/DualBoot.md

- ⚠️ You need to backup your original boot image for OTAs to work with Android. When you get an OTA, you will want to revert your boot image for the update to work, or you'll have to use an official OTA recovery package.
  </p>
</details>

---

[▶️ Install Surface Duo (1st Gen) UEFI and Drivers for Windows from scratch (Clean Installation)](https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/InstallWindows/InstallWindows-SurfaceDuo1.md)

[▶️ Install Surface Duo 2 UEFI and Drivers for Windows from scratch (Clean Installation)](https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/InstallWindows/InstallWindows-SurfaceDuo2.md)

[▶️ Update from an older version of Surface Duo UEFI and Drivers (both got updated with v2406.36)](https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Update/UpdateDriversAndUEFI.md)

---

### Release notes

Surface Duo (1st Gen):

- Power Management Updates:

	- Improves Surface Duo (1st Gen) thermal performance

	- Introduces Battery Current Limiter Monitoring and Mitigations to reduce power draw

	- Enables proper Low Power Mode for all CPU cores

	- Enables support for new thermal firmware features in UEFI vNext

- Panel Driver Updates:

	- Faster init

	- Simpler init code

	- Handles brightness control differently in conjunction with acpi updates

- GPU Driver Updates

	- Update Qualcomm DirectX Driver

	- Update Qualcomm Elite Gaming Profile Driver

	- Update Qualcomm OpenCL Driver

	- Update Qualcomm Vulkan Driver

- Sensor Driver Updates

- WiFi Driver Updates

---

Common:

- Posture Service Updates:

	- Addresses issues that prevented the device from adapting to correct postures with recent versions of Windows (ZN+)

	- Addresses a recent issue preventing the device from reacting to being flipped and not switching the displays

	- Reworks the behavior of the auto rotation functionality. When rotation lock is enabled, the device will still react to posture changes, without rotation updates

	- Fixes an issue where OOBE would break when a posture change was detected

	- Fixes an issue where rotation lock prevented flipping the device

	- Fixes an issue where the wallpaper wouldn't span properly across both displays

---

Misc:

- Removed E

---

- Please download ```SurfaceDuo-Drivers-v2406.36-Desktop-Epsilon.zip``` if you want drivers for Surface Duo 1

- Please download ```SurfaceDuo-Drivers-v2406.36-Desktop-Zeta.zip``` if you want drivers for Surface Duo 2

---

- We are aware auto pairing of the pen will not work anymore on Windows 10, a fix is due in the next update.

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
Please follow the steps detailed at https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Update/UpdateDriversAndUEFI.md
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
