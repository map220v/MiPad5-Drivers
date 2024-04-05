@echo off
REM rmdir /Q /S ..\..\MiPad5-Drivers-Release
mkdir ..\..\MiPad5-Drivers-Release

echo @echo off > ..\OnlineUpdater.cmd
echo DriverUpdater.%%PROCESSOR_ARCHITECTURE%%.exe -r . -d .\definitions\Desktop\ARM64\Internal\nabu.xml >> ..\OnlineUpdater.cmd

echo @echo off > ..\OfflineUpdater.cmd
echo for /f %%%%a in ('wmic logicaldisk where "VolumeName='WINNABU'" get deviceid^^^|find ":"')do set "DrivePath=%%%%a" >> ..\OfflineUpdater.cmd
echo if not [%%DrivePath%%]==[] goto start >> ..\OfflineUpdater.cmd
echo if [%%DrivePath%%]==[] echo Automatic WINNABU detection failed! Enter Drive Letter manually. >> ..\OfflineUpdater.cmd
echo :sdisk >> ..\OfflineUpdater.cmd
echo set /P DrivePath=Enter Drive letter of WINNABU ^^^(should be X:^^^): >> ..\OfflineUpdater.cmd
echo if [%%DrivePath%%]==[] goto sdisk >> ..\OfflineUpdater.cmd
echo if not "%%DrivePath:~1,1%%"==":" set DrivePath=%%DrivePath%%:>> ..\OfflineUpdater.cmd
echo :start >> ..\OfflineUpdater.cmd
echo if not exist "%%DrivePath%%\Windows\" echo Error! Selected Disk "%%DrivePath%%" doesn't have any Windows installation. ^& pause ^& exit >> ..\OfflineUpdater.cmd
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
echo components\QC8150\OEM\OEM.SOC_QC8150.QCOM >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE_MINIMAL >> filelist_nabu.txt
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
