$PolicyFolder = Join-Path $PSScriptRoot "AppLockExport\YourExport"
$XmlFile = Join-Path $PolicyFolder "AppLocker-Exe.xml"

New-Item -Path $PolicyFolder -ItemType Directory -Force | Out-Null

Get-AppLockerPolicy -Local -Xml |
    ForEach-Object {
        [xml]$xml = $_

        # Alle RuleCollections außer Exe entfernen
        @($xml.AppLockerPolicy.RuleCollection) |
            Where-Object { $_.Type -ne "Exe" } |
            ForEach-Object {
                $_.ParentNode.RemoveChild($_) | Out-Null
            }

        $xml.Save($XmlFile)
    }
#by nonondr