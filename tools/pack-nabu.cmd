@echo off
REM rmdir /Q /S ..\..\MiPad5-Drivers-Release
mkdir ..\..\MiPad5-Drivers-Release

echo CODE_OF_CONDUCT.md >> filelist_nabu.txt
echo components\ANYSOC\Changelog >> filelist_nabu.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.BASE >> filelist_nabu.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.MOBILE_COMPONENTS >> filelist_nabu.txt
echo components\ANYSOC\Support\Desktop\SUPPORT.DESKTOP.POST_UPGRADE_ENABLEMENT >> filelist_nabu.txt
echo components\QC8150\Device\DEVICE.SOC_QC8150.NABU >> filelist_nabu.txt
echo components\QC8150\Device\DEVICE.SOC_QC8150.NABU_MINIMAL >> filelist_nabu.txt
echo components\QC8150\Graphics\GRAPHICS.SOC_QC8150.NABU_DESKTOP >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BASE_MINIMAL >> filelist_nabu.txt
echo components\QC8150\Platform\PLATFORM.SOC_QC8150.BATTERY >> filelist_nabu.txt
echo definitions\Desktop\ARM64\Internal\nabu.txt >> filelist_nabu.txt
echo definitions\Desktop\ARM64\PE\nabu.txt >> filelist_nabu.txt
echo LICENSE.md >> filelist_nabu.txt
echo README.md >> filelist_nabu.txt

cd ..
"%ProgramFiles%\7-zip\7z.exe" a -tzip ..\MiPad5-Drivers-Release\MiPad5-Drivers-Desktop.zip @tools\filelist_nabu.txt -scsWIN
"%ProgramFiles%\7-zip\7z.exe" a -t7z ..\MiPad5-Drivers-Release\MiPad5-Drivers-Desktop.7z @tools\filelist_nabu.txt -scsWIN
cd tools

del filelist_nabu.txt
