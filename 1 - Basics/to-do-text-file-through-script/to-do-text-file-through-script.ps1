# Prompt the user and add their input to the textfile.txt
# Adding instead of setting so previous items are not lost

$text = Read-Host "What item to you want to add to your to-do list? "
$text | add-Content $PSScriptRoot\textfile.txt