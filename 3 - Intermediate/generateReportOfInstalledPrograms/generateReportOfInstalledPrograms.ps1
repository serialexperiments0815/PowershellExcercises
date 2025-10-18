# Exports CSV file containing all installed programms

# Test-Path added to avoid Remove-Item error on first execution.
# Remove-Item was added to avoid complications with Export-Csv function.
# Delimiter was added to not have all properties stacked in the same column.
if (Test-Path "./InstalledPrograms.csv"){
Remove-Item -Path "./InstalledPrograms.csv"
}
Get-Package | Select-Object -Property Name, Version, Summary |
Export-Csv -Path "./InstalledPrograms.csv" -NoTypeInformation -Delimiter ";"
