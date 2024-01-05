@echo off
REM rmdir /Q /S ..\..\MiPad5-Drivers-Release
mkdir ..\..\MiPad5-Drivers-Release

echo @echo off > ..\OnlineUpdater.cmd
echo DriverUpdater.%%PROCESSOR_ARCHITECTURE%%.exe -r . -d .\definitions\Desktop\ARM64\Internal\nabu.xml >> ..\OnlineUpdater.cmd

echo @echo off > ..\OfflineUpdater.cmd
echo set /P DrivePath=Enter Drive letter ^^^(with the semi-column!^^^) of the connected device in mass storage mode ^^^(e.g. D:^^^): >> ..\OfflineUpdater.cmd
echo DriverUpdater.%%PROCESSOR_ARCHITECTURE%%.exe -r . -d .\definitions\Desktop\ARM64\Internal\nabu.xml -p %%DrivePath%% >> ..\OfflineUpdater.cmd

copy DriverUpdater.ARM64.exe ..\
copy DriverUpdater.AMD64.exe ..\
copy DriverUpdater.X86.exe ..\

echo CODE_OF_CONDUCT.md >> filelist_nabu.txt
echo components\ANYSOC\Changelog >> filelist_nabu.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_nabu.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_nabu.txt
echo components\QC8150\Device\DEVICE.SOC_QC8150.NABU >> filelist_nabu.txt
echo components\QC8150\Device\DEVICE.SOC_QC8150.NABU_MINIMAL >> filelist_nabu.txt
echo components\QC8150\Graphics\GRAPHICS.SOC_QC8150.NABU_DESKTOP >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE_MINIMAL >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BATTERY >> filelist_nabu.txt
echo definitions\Desktop\ARM64\Internal\nabu.xml >> filelist_nabu.txt
echo definitions\Desktop\ARM64\PE\nabu.xml >> filelist_nabu.txt
echo DriverUpdater.ARM64.exe >> filelist_nabu.txt
echo DriverUpdater.AMD64.exe >> filelist_nabu.txt
echo DriverUpdater.X86.exe >> filelist_nabu.txt
echo LICENSE.md >> filelist_nabu.txt
echo OfflineUpdater.cmd >> filelist_nabu.txt
echo OnlineUpdater.cmd >> filelist_nabu.txt
echo README.md >> filelist_nabu.txt

cd ..
"%ProgramFiles%\7-zip\7z.exe" a -tzip ..\MiPad5-Drivers-Release\MiPad5-Drivers-Desktop.zip @tools\filelist_nabu.txt -scsWIN
"%ProgramFiles%\7-zip\7z.exe" a -t7z ..\MiPad5-Drivers-Release\MiPad5-Drivers-Desktop.7z @tools\filelist_nabu.txt -scsWIN
cd tools

del ..\OfflineUpdater.cmd
del ..\OnlineUpdater.cmd
del ..\DriverUpdater.ARM64.exe
del ..\DriverUpdater.AMD64.exe
del ..\DriverUpdater.X86.exe
del filelist_nabu.txt
