@echo off

      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

      set SIGN_OEM=1
      set DIR=%CD%
      cd "F:\Program Files\Windows Kits\10\tools\bin\i386"
      c:

      mkdir "%DIR%\Image_%dtStamp%_Epsilon"
      imggen "%DIR%\Image_%dtStamp%_Epsilon\Flash.vhd" "%DIR%\OEMInput.Epsilon.xml" "%DIR%" ARM64
      cd %DIR%