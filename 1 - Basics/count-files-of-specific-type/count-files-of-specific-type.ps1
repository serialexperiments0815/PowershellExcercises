# Call 'Get-ChildItem' cmdlet method to retrieve filesystem objects. 
# './' specifies current directory. 
# '-Recurse' instructs iterations through subdirectories. 
# '-File' returns results for files only, no directories.
# '-Filter' returns results for specified string pattern.

Get-ChildItem -Path "$($PSScriptRoot)" -Recurse -File -Filter *.ps1  