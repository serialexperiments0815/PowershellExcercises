# Creates downloads Folder and uses the Invoke-WebRequest function to acquire and download file to said folder.
# System.IO.Path is called to extract Filename from URL. 
# Microsoft.VisualBasic.Interaction is called to provide simple input dialog.

$downloadFolder = "$($PSScriptRoot)/downloads"

if (-not (Test-Path $downloadFolder)){
    New-Item -Path $downloadFolder -ItemType Directory
}

Add-Type -AssemblyName Microsoft.VisualBasic
$userInput = [Microsoft.VisualBasic.Interaction]::InputBox("Enter URL: ", "downloadFilesFromURL", "")
# [System.Windows.Forms.MessageBox]::Show("Your entered URL is '$userInput'.", "Alert",
# [System.Windows.Forms.MessageBoxButtons]::Ok,
# [System.Windows.Forms.MessageBoxIcon]::Information)

if (-not $userInput -or -not ($userInput -match "^https?://")){
    [System.Windows.Forms.MessageBox]::Show("Incorrect URL : $userInput", "Alert",
    [System.Windows.Forms.MessageBoxButtons]::Ok,
    [System.Windows.Forms.MessageBoxIcon]::Error)
    return
}

$fileName = [System.IO.Path]::GetFileName($userInput)
$downloadFolderPath = Join-Path $downloadFolder $fileName
Invoke-WebRequest -Uri $userInput -OutFile $downloadFolderPath -ErrorAction Stop
