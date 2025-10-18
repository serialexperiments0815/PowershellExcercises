# Opens notepad process/program if it is not in the running Process list. 
# processName variable for easy exchange of process
# Forms Messagebox instead of Write-Host for more urgency

$processName = "notepad"

while ($true){
    if (-not (Get-Process -name $processName -ErrorAction SilentlyContinue)){
        [System.Windows.Forms.MessageBox]::Show("$processName is not running! It will now be opened.", "Alert", 
        [System.Windows.Forms.MessageBoxButtons]::Ok,
        [System.Windows.Forms.MessageBoxIcon]::Warning)
        Start-Process $processName
    }
}