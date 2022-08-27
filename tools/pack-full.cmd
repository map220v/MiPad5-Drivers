@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\MIX3_5G-Drivers-Release
REM mkdir ..\..\MIX3_5G-Drivers-Release

mkdir MIX3_5G-Drivers-Full
mkdir MIX3_5G-Drivers-Full\components
mkdir MIX3_5G-Drivers-Full\definitions
xcopy /cheriky ..\components\ANYSOC MIX3_5G-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\components\QC8150 MIX3_5G-Drivers-Full\components\QC8150
xcopy /cheriky ..\definitions\Desktop MIX3_5G-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\MIX3_5G-Drivers-Release\MIX3_5G-Drivers-Full.zip MIX3_5G-Drivers-Full\*

REM move MIX3_5G-Drivers-Full\components\ANYSOC ..\components\ANYSOC
REM move MIX3_5G-Drivers-Full\components\QC8150 ..\components\QC8150
REM move MIX3_5G-Drivers-Full\definitions\Desktop ..\definitions\Desktop

rmdir /Q /S MIX3_5G-Drivers-Full