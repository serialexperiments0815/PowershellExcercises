# Call 'Get-ChildItem' cmdlet method to retrieve filesystem objects. 
# './' specifies current directory. 
# '-Recurse' instructs iterations through subdirectories. 
# '-File' returns results for files only, no directories. 

Get-ChildItem -Path "$($PSScriptRoot)" -Recurse -File |

    # Call 'Select-Object' cmdlet method to return specified properties.
    # '-Property FullName' returns full String path for each object.
    # '-Property LastWriteTime' returns DateTime for last modification.

    Select-Object -Property FullName, LastWriteTime |
    
    # Call 'Export-Csv' cmdlet method to convert outputs into CSV file.
    # '-Path './folderFiles.csv'' returns output of file in current directory.
    # '-NoTypeInformation' supresses #TYPE metadata line.

    Export-Csv -Path "$($PSScriptRoot)/folderFiles.csv" -NoTypeInformation