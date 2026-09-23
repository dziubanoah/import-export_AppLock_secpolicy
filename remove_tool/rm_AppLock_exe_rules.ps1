# Admin prüfen
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Bitte als Administrator starten!"
    exit 1
}

# IDs
$RuleIds = @(
    "0cbb08fe-9d8e-4c21-a426-db4c59ed9e12"
    "921cc481-6e17-4653-8f75-050b80acca20"
    "a61c8b2c-a319-4cd0-9690-d2177cad7b51"
    "fd686d83-a829-4351-8ff4-27c7de5755d2"
    "a9e18c21-ff8f-43cf-b9fc-db40eed693ba"
)

[xml]$Policy = Get-AppLockerPolicy -Local -Xml

foreach ($Collection in $Policy.AppLockerPolicy.RuleCollection) {
    foreach ($Rule in @($Collection.ChildNodes)) {
        if ($Rule.Id -in $RuleIds) {
            $Collection.RemoveChild($Rule) | Out-Null
        }
    }
}

$Temp = "$env:TEMP\AppLocker-Remove.xml"
$Policy.Save($Temp)
Set-AppLockerPolicy -XmlPolicy $Temp
Remove-Item $Temp -Force

Write-Host "Regeln entfernt."
