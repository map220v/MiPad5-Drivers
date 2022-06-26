## Surface Duo Drivers BSP - Version 2206.86
**Released:** 6/26/2022 12:00 PM UTC+2

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

#### Important information

- ⚠️⚠️ **IMPORTANT: This version of the drivers needs to be paired with UEFI version 2.29.** ⚠️⚠️
- It is expected currently for the boot process to look very rough on the right panel, when the image will change on the left the panel will act normally. This is the beginning, so bear with us for now :) Your displays aren't broken, and won't get damaged.
- It is also expected for some rendering glitches to happen right now, do not freak out, it's not going to damage anything, your gpu isn't dying, it's ok. Here's an example of a glitch you may be expecting:

<details>

![image](https://user-images.githubusercontent.com/3755345/166138815-bdc8d4f4-151b-4d37-aa7a-d68f75c259ce.png)

</details>


### Changelog


- Updates to Surface Touch Driver stack
— Brings improvements to Surface Pen support
— Brings updated firmware for 3 pen models
— Adds support for slim pen 2 haptics feature (untested)
— Improvements to Automatic Bluetooth pen pairing
— Improvements to pen integration
- Updates to Surface Integration services
- Updates to Surface Panel Calibration files (sRGB/Standard)
- Updates to Qualcomm(R) Adreno(TM) 640 GPU driver
- Updates to Qualcomm(R) Peripheral Image Loader
- Updates to Qualcomm(R) Secure Channel Monitor Driver
- Improved Windows tablet experience support. The device will now be treated as a tablet and thus, bigger taskbar, ui elements, and more will be enabled
- Improvements to Device Power Consumption under Windows
- Updates for a future Windows version
- Fixed an issue preventing Modem EFS from being exposed to the Remote Modem Processor
- Fixed an issue that would cause modifications to be done on the Android Modem EFS partitions instead of the Windows EFS partitions
- Removed unused files/drivers
- Added support for the Modem Radio Interface Layer
- Added support for Relay Chat Services (RCS)
- Added support for IP Multimedia System (IMS)
- Added support for VoLTE
- Added support for Modem Calls Infrastructure
- Added support for Modem Text Infrastructure

**NOTE: Modem remains disabled in this release despite changes being made in regards to the Modem!**

__This update brings feature parity with the June Surface Pro X Update as well as the March Qualcomm 8cx BSP update (1.7.600.0)__


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
- Both Batteries (no charging)
- 29 Sensors (see above)

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
