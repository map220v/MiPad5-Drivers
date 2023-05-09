## Surface Duo Drivers BSP - Version 2305.25
**Released:** 05/08/2023 10:00 PM UTC+2

**Quality:** Preview

![Surface Duo Dual Screen Windows](https://user-images.githubusercontent.com/3755345/197420866-d3bb0534-c848-4cc2-a242-04dae48b0f6e.png)

### General information

You can view compatibility for this release, along with important information and what works, and what doesn't at this link: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Status.md


### Release notes

____________________________________________________________________________________________________________________________

#### Important information

- ⚠️ This version of the drivers needs to be paired with UEFI version greater or equal to 2305.25.

- ⚠️ For users that are updating from an earlier release than version 2301.93, please follow the following migration guidance https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/Update/MigrationGuidanceForSecureBoot.md and please download the latest driverupdater release as well!: https://github.com/WOA-Project/DriverUpdater/releases/tag/v1.8.0.0

- ⚠️ If you need dual boot, you will have to make your own image, please follow this guidance: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/DualBoot.md

- ⚠️ You need to backup your original boot image for OTAs to work with Android. When you'll get an OTA, you will want to revert your boot image for the update to work or you'll have to use an official OTA recovery package.

### Changelog

#### Surface Duo 1

What's new?

- **_New!_** Updated a bunch of drivers with stability and enhancements. Notably, you will now notice the GPU driver and Display stack is much more stable, brightness issues are gone, and OpenGL based applications run much better than they used to.

- **_New!_** Started reworking Camera Subsystem. No new apparent functionality is enabled as of this release yet.

- **_New!_** Started reworking Sensors subsystem. No new apparent functionality is enabled as of this release yet.

- **_New!_** Started reworking Audio subsystem. No new apparent functionality is enabled as of this release yet.

- **_New!_** Started reworking Battery subsystem. No new apparent functionality is enabled as of this release yet.

- **_New!_** Added a debounce delay for the power button to prevent accidental quick wake ups of the display continuously.

- **_New!_** You can now transfer files in and out of the device again using USB MTP.

- **_New!_** The display scaling now defaults to 250% for your eye comfort.

- **_New!_** Applications such as Phone Link will now work again under Windows Zinc Semester builds (ZN_RELEASE).

- **_New!_** Windows Zinc Semester builds are now installable again.

- **_New!_** This update resolves some issues impacting WiFi connectivity and reliability on WiFi 6 networks.

- **_New!_** This update resolves a crash issue under Windows 11 Build 22000 and lower.

- **_New!_** Further Enhancements to Audio Listener Voice activation models for voice assistants such as Alexa or Cortana.

- **_New!_** This update resolves display refresh rate and syncing issues with both screens in tandem.

- **_New!_** This update resolves key issues with Windows Core OS support.

- **_Important!_** Some changes/bug fixes had to be delayed for this release, a newer version will be released mid this week alongside a new flashing method and WCOS ffus. Stay tuned!

- **_Important!_** Surface Duo 2 is now supported again but was untested. Make sure everything is up to date beforehand (UEFI notably)

- **_Important!_** Charging has been permanently removed until further notice. Installing it will not do anything anymore.

- **_Important!_** Sensor functionality and/or calls may be affected under ZN_RELEASE Currently, we're working on a fix.

- **_Important!_** New definition files are present, here's a summary of how to proceed:


I am running a build < 17763, you are unsupported.

I am running a build < 18362, use Driver Updater with ```\definitions\Desktop\ARM64\epsilon_rs5.txt```

I am running a build < 19041, use Driver Updater with ```\definitions\Desktop\ARM64\epsilon_ti.txt```

I am running a build < 25346, use Driver Updater with ```\definitions\Desktop\ARM64\epsilon_vb.txt```

I am running a build >= 25346, use Driver Updater with ```\definitions\Desktop\ARM64\epsilon_zn.txt```


Known issues

- Booting Windows 10 18362/18363 will lead to "static screen" effects on the right display much like driver releases from last year did on any version of Windows. A fix is being worked on for the next release.
- The TPM driver is not working for Windows 10 18362/18363. A fix is being worked on for the next release.
- The Posture driver is not working for Windows 10 18362/18363. A fix is being worked on for the next release.
- Enhanced auto rotation is not working for Windows 10 18362/18363. A fix is being worked on for the next release.
- Brightness control is glitchy on both displays
- Audio speakers are not functional
- Dongles are not detected correctly when plugged into the USB Type C port
- Battery charging remains unstable and not recommended
- Updating drivers may lead to weird configurations if done on old driver releases
- MAC Addresses do not reflect the real addresses asigned to the device
- Bitlocker drive encryption is not available
- USB Dongles that are not externally powered may not currently work
- USB C Billboard devices will not currently work
- External Display Stream support will not currently work
- Additional information provided by the posture sensor is currently not available for public consumption, this includes peek events.
- Digitizers will not react to the device being folded over
- Displays will not react to the device being folded over most of the time
- Physical device data is incorrect
- Digitizers aren't calibrated correctly
- Flipping the device however is not smooth
- Charging remains unavailable in Windows, please charge in Android
- Users upgrading from releases older than the January ones may want to clean install again.
- Booting Windows 10 18362/18363 with Secure Boot enabled is not currently supported and will result in a broken installation.
- In some cases booting the UEFI image may lead to static screen effects on the left display. Please do not force reboot the device as it may interrupt the installation process, if ongoing, and instead please wait a few minutes
- Windows Recovery environment lacks drivers unless Windows has performed a Feature Update at least once.
- sRGB is not available currently, and displays will not react to ICC profiles being applied.


#### Surface Duo 2

- Support for Surface Duo 2 is not provided with this release. We are trying to get an update for Surface Duo 2 as part of the next release as soon as we can.


### Accessing Foldable Sensors from your applications


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
