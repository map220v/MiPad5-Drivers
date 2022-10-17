## Surface Duo Drivers BSP - Version 2210.41
**Released:** 10/13/2022 01:00 AM UTC+2

**Quality:** Preview

![Surface Duo Dual Screen Windows](https://user-images.githubusercontent.com/3755345/170788230-a42e624a-d2ed-4070-b289-a9b34774bcd0.png)

### General information

You can view compatibility for this release, along with important information and what works, and what doesn't at this link: https://github.com/WOA-Project/SurfaceDuo-Guides/blob/b95e43f5b2e16ba715d9339012d7beb8f11926b6/Status.md


### Release notes

____________________________________________________________________________________________________________________________

#### Important information

- ⚠️⚠️ **IMPORTANT: This version of the drivers needs to be paired with UEFI version greater or equal to 2210.38.** ⚠️⚠️
- ⚠️⚠️ **IMPORTANT: If you get a BSOD/Bugcheck "SOC_SUBSYSTEM_FAILURE" when upgrading, you will have to reinstall Windows** ⚠️⚠️
- ⚠️⚠️ **IMPORTANT: Upgrades using DriverUpdater *may* lead under some rare cases to the GPU device not being loaded on next boot, to fix this, go to device manager and manually update the GPU device again.** ⚠️⚠️

### Changelog

- Addresses an issue with reboots and sleeps resulting in a BSOD when performing PSCI Memory Protection SMC calls (UEFI side)

- Updated Surface Integration driver and Cellular provisioning packages

- Improvements to Qualcomm Peripheral Image Loader configuration settings

- Started work on Qualcomm Aqstic Speaker Protection driver. A downside of this release is a regression in Mic availability which will be resolved in a future update

- Started work on Dolby Access support for Surface Duo Audio stack.

- Call provisioning is work in progress, if calls do not work for you at the moment, you may need to provision the call functionality manually. (Same as on Lumia 950s: https://woa-project.github.io/LumiaWOA/guides/ican0/, value is not different between 950s and Duo either, so if you already have such value, you're good to go, this is temporary!)


__Improvements to CPU core clock frequency will come in an upcoming release__


### Sensor Calibration Provisioning (Mandatory)


In order to get most sensors currently working, some manual steps are required.
Please follow the steps described at https://github.com/WOA-Project/SurfaceDuo-Guides/blob/main/InstallWindows.md#temporary-copy-over-calibration-filesconfiguration-files-for-the-sensors


It may also be possible to provision it using data from the SFPD partition exposed in windows. This manual step will not be required in future releases.


### Known issues


- Automatic Orientation only works for the left panel, using the right panel orientation sensor
- USB Dongles that are not externally powered may not currently work
- USB C Billboard devices will not currently work
- External Display Stream support will not currently work
- Additional information provided by the posture sensor is currently not available for public consumption, this includes peek events.
- Digitizers will not react to the device being folded over
- Displays will not react to the device being folded over most of the time
- Physical device data is incorrect
- Graphical Rendering Issues


### Accessing Foldable Sensors from your applications


In order to currently access the sensor data given by the foldable sensors, you need to use the following apis:


- Windows.Devices.Sensors.HingeAngleSensor*
- Windows.Internal.Devices.Sensors.FlipSensor* (2)
- Windows.Internal.System.TwoPanelHingeFolioPostureDevice* (2)


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

VOID PrintFolioDetails(TwoPanelFolioHingeDevicePostureReading const& args)
{
	try {
		std::cout << "Panel1 " << args.Panel1Id().c_str() << "\n" << std::endl;
		std::cout << "Panel2 " << args.Panel2Id().c_str() << "\n" << std::endl;

		std::cout << "Panel1 Orientation " << (int)args.Panel1Orientation() << "\n" << std::endl;
		std::cout << "Panel2 Orientation " << (int)args.Panel2Orientation() << "\n" << std::endl;

		switch (args.Hinge1State())
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

		switch (args.Hinge2State())
		{
		case Windows::Internal::System::HingeState::Unknown:
			std::cout << "Hinge2State Unknown\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Closed:
			std::cout << "Hinge2State Closed\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Concave:
			std::cout << "Hinge2State Concave\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Flat:
			std::cout << "Hinge2State Flat\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Convex:
			std::cout << "Hinge2State Convex\n" << std::endl;
			break;
		case Windows::Internal::System::HingeState::Full:
			std::cout << "Hinge2State Full\n" << std::endl;
			break;
		}
	}
	catch (...) {}
}

VOID OnFolioPostureChanged(TwoPanelFolioHingeDevicePosture const&, TwoPanelFolioHingeDevicePostureReadingChangedEventArgs const& args)
{
	try {
		printf("Folio posture sensor state changed.\n");
		PrintFolioDetails(args.Reading());
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

	printf("Trying to get folio posture sensor.\n");
	try {
		TwoPanelFolioHingeDevicePosture folioPosture = TwoPanelFolioHingeDevicePosture::GetDefaultAsync().get();
		if (folioPosture == nullptr)
		{
			printf("Folio Posture sensor not found.\n");
		}
		else
		{
			auto curpst = folioPosture.GetCurrentPostureAsync().get();
			if (curpst != nullptr)
			{
				PrintFolioDetails(curpst);
			}
			printf("Starting listening session for Folio Posture sensor.\n");
			folioPosture.PostureChanged(OnFolioPostureChanged);
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
