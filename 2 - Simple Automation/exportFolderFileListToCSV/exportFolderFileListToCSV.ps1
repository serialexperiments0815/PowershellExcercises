# Export all file and folder path to folderFileList.csv
# Select-Object FullName property was chosen to only export the full path.
Get-ChildItem -Path "$($PSScriptRoot)" -Recurse | 
Select-Object -Property FullName  | 
Export-Csv -Path "$($PSScriptRoot)/folderFileList.csv" -NoTypeInformation