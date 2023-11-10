#-------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation.  All rights reserved.
#-------------------------------------------------------------------------------
$Global:ErrorActionPreference = 'Stop'
$logPath = "$PSScriptRoot\ImageConfigurationOOBE.log"

function ImageConfig {
    trap {
        $_
        Write-Host 'Stack Trace'
        Write-Host $_.ScriptStackTrace
    }

    Write-Host "> Prune extra Office languages to save space"
    & "${env:CommonProgramFiles}\Microsoft Shared\ClickToRun\OfficeClickToRun.exe" scenario=CULTUREREFRESH RemoveNonClientCultures=True displaylevel=False

    #Clean up
    #Remove-Item -LiteralPath $MyInvocation.MyCommand.Path -Force -ErrorAction Ignore

    #No Reboot
    [Environment]::Exit(0)
}
Start-Transcript -Path $logPath
try {
    ImageConfig
}
catch {
    [Environment]::Exit(1)
}
finally {
    Stop-Transcript
}
