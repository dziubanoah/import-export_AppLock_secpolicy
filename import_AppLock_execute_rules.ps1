$XmlFile = Join-Path $PSScriptRoot "AppLockExport\AppLocker-Exe.xml"

Set-AppLockerPolicy -XmlPolicy $XmlFile
