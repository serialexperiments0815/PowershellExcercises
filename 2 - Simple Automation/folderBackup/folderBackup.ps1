# Copy 'important' folder to 'safe' location
# Get-ChildItem -Filter parameter was deemed insufficient and replaced by -Directory | Where-Object
# As the -Filter parameter only matches folders at current level, not recursively in all subfolders.

$nameOfFolder = "important"
$directionOfFolder = Get-ChildItem -Path "./" -Recurse -Directory | Where-Object { $_.Name -eq $nameOfFolder }
Copy-Item -Path $directionOfFolder.FullName -Destination (Join-Path "./safe/" $directionOfFolder.Name) -Recurse -Force 
