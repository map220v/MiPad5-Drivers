###############################################
On Device Logging of Hardware Accelerated DPL
###############################################

Data Protocol Logging (DPL) provides a convenient way to collect and analyze modem PCAP logs

For very high data rate scenarios:

1. Partial DPL over IPA hardware accelerated data path can provide a reliable packet capture mechanism instead of Full DPL logging over Diag/SW data path

2. Hardware accelerated Partial DPL packets can be captured either on an external tethered host machine using QXDM or they can be logged on the device itself

ADPL using ODL feature enables routing of ADPL log packets from IPA/Q6 to be written to the local file system on the device which can be later post processed using Qualcomm APEX tool. APEX can parse and convert the .adpl format capture file to wireshark readable PCAP format IP packets log file

-----------------------------------------------
ADPL using ODL Necessary Components:
-----------------------------------------------

The following components must be enabled in ACPI and be installed on the device for ADPL using ODL to be functional

1. DPLBridge Kernel Mode Driver (ACPI + INF installation)

2. ODL User Mode Application (.exe)

3. QCDiagBridge Kernel Mode Driver (ACPI + INF installation)

-----------------------------------------------
ADPL using ODL Device Configuration:
-----------------------------------------------

ADPL over ODL on Windows Desktop uses QcDiagBridge driver to communicate logmask information to the modem. So, the following registry settings are necessary to configure the device for on device logging

HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\QCDIAGROUTER\Parameters\ServerName -> "127.0.0.1"
HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\QCDIAGROUTER\Parameters\TransportType -> 0

-----------------------------------------------
ADPL using ODL Capture Procedure:
-----------------------------------------------

1. Boot up the device and bring up the data call
2. Copy the qcodl.exe from the DPLBridge driver repository folder E.g. "C:\Windows\System32\DriverStore\FileRepository\qcdplbridge8150.inf_arm64_xxxxxxxxxxxx" to the "C:\Windows\System32" directory
3. Execute the following command from an elevated command prompt to start ADPL over ODL logging
                     >qcodl 1
4. Execute the test scenario
5. Execute the following command from an elevated command prompt to stop ADPL over ODL logging
                     >qcodl 0
6. Note the file name printed at the output of the above stop command and retrieve the .adpl format file from "C:\Data\SystemData\ETW" directory on the device
7. Open the .adpl file in Qualcomm APEX tool (can be downloaded from CreatePoint) and convert it to PCAP format using the "Tools menu -> Convert log to PCAP/TXT" option

-----------------------------------------------
ADPL using ODL Debug Log Collection Procedure:
-----------------------------------------------

The following logs must be collected inorder to debug any ADPL using ODL failures/issues

1. DPL Bridge driver WPP logs
2. IPA driver WPP logs
3. QcDiagBridge driver WPP logs
4. qcodl.exe command window error prints

-----------------------------------------------
ADPL using ODL Capture Limitations:
-----------------------------------------------

1. ADPL using ODL capture and QXDM log collection from a tethered machine cannot be performed simultaneously. When device is configured for ADPL using ODL, device will not get detected in QPST
2. ADPL using ODL will not work when device is configured in DPLComposite mode (USB PID 90B7) since user is expected to use QXDM from a tethered machine to collect ADPL in that specific device configuration
3. If the necessary driver components are not ACPI enabled and installed on the device, ADPL using ODL will not work
4. ADPL using ODL cannot be enabled during bootup and user has to start/stop logging after bootup