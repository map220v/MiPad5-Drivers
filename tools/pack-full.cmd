@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\SurfaceDuo-Drivers-Release
REM mkdir ..\..\SurfaceDuo-Drivers-Release

mkdir SurfaceDuo-Drivers-Full
mkdir SurfaceDuo-Drivers-Full\components
mkdir SurfaceDuo-Drivers-Full\definitions
xcopy /cheriky ..\components\ANYSOC SurfaceDuo-Drivers-Full\components\ANYSOC
xcopy /cheriky ..\components\QC8150 SurfaceDuo-Drivers-Full\components\QC8150
xcopy /cheriky ..\definitions\Desktop SurfaceDuo-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\SurfaceDuo-Drivers-Release\SurfaceDuo-Drivers-Full.zip SurfaceDuo-Drivers-Full\*

REM move SurfaceDuo-Drivers-Full\components\ANYSOC ..\components\ANYSOC
REM move SurfaceDuo-Drivers-Full\components\QC8150 ..\components\QC8150
REM move SurfaceDuo-Drivers-Full\definitions\Desktop ..\definitions\Desktop

rmdir /Q /S SurfaceDuo-Drivers-Full