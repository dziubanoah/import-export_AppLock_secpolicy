$XmlFile = Join-Path $PSScriptRoot "AppLockExport\AppLocker-App_pac.xml"

Set-AppLockerPolicy -XmlPolicy $XmlFile -Merge
