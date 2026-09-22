$ExeXml = Join-Path $PSScriptRoot "AppLockExport\AppLocker-Exe.xml"
$AppxXml = Join-Path $PSScriptRoot "AppLockExport\AppLocker-App_pac.xml"

Set-AppLockerPolicy -XmlPolicy $ExeXml -Merge
Set-AppLockerPolicy -XmlPolicy $AppxXml -Merge
#by nonondr