# File searches for txt files and replaces specified string.

$textFiles = Get-ChildItem -Path "$($PSScriptRoot)" -Filter *.txt
$searchText = 'this text is false'
$replaceText = 'this text is true'
foreach($textFile in $textFiles){
    (Get-Content $textFile) -replace $searchText, $replaceText | Set-Content $textFile
}