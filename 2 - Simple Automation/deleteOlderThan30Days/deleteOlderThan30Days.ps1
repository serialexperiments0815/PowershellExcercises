# Deletes all objects older than 30 days inside the folder. 
# -WhatIf Parameter was chosen for Remove-Item to remove the necessity for file -recreation
# Should creation of an file older than 30 days for testing purposes be necessary, run this script:

# $file = "./testing.txt"
# New-Item -Path $file -ItemType File -Force
# $oldDate = (Get-Date).AddDays(-31)
# (Get-Item $file).LastWriteTime = $oldDate
# (Get-Item $file).LastAccessTime = $oldDate

Get-ChildItem ".\" -Recurse | 
Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} |
Remove-Item -Force -WhatIf

