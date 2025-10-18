# File creates listeners for happenings folder
# Listens for file creation, deletion, renaming
# Exports events to log.txt

# $fsw to save typing for three listeners. 
# Property @{IncludeSubdirectories = $true} to trigger listeners in subdirectories too.
# EnableRaisingEvents = $true explicitely enabled for completeness sake, by default powershell implicitely turns it on.
$fsw = New-Object IO.FileSystemWatcher "$($PSScriptRoot)/happenings/" -Property @{
    IncludeSubdirectories = $true
    EnableRaisingEvents = $true}

Register-ObjectEvent $fsw Created -SourceIdentifier "fileFolderCreated" -Action {
    $name = $Event.SourceEventArgs.Name
    $fullPath = $Event.SourceEventArgs.FullPath

    Add-Content "./log.txt" -value "[FILE CREATION]: DATE: $(Get-Date), NAME: $name, PATH: $fullPath"
}

Register-ObjectEvent $fsw Deleted -SourceIdentifier "fileFolderDeleted" -Action {
    $name = $Event.SourceEventArgs.Name
    $fullPath = $Event.SourceEventArgs.FullPath

    Add-Content "./log.txt" -value "[FILE DELETION]: DATE: $(Get-Date), NAME: $name, PATH: $fullPath"
}

Register-ObjectEvent $fsw Renamed -SourceIdentifier "fileFolderRenamed" -Action {
    $oldName = $Event.SourceEventArgs.OldName
    $oldFullPath = $Event.SourceEventArgs.OldFullPath
    $name = $Event.SourceEventArgs.Name
    $fullPath = $Event.SourceEventArgs.FullPath

    Add-Content "./log.txt" -value "[FILE RENAMING]: DATE: $(Get-Date), OLDNAME: $oldName, OLDPATH: $oldFullPath, NEWNAME: $name, NEWPATH: $fullPath"
}

# See active listeners
# Get-EventSubscriber -Force | Format-Table -AutoSize

# Remove all active listeners
# Get-EventSubscriber -Force | Unregister-Event -Force
