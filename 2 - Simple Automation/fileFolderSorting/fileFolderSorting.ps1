# Assign all relevant file-extensions to arrays to easily filter through them during a for-loop
# This approach was choosen for its simplicity and visibility

[String[]]$videoFormat = "mp4", "mkv", "mov", "avi", "wmv", "flv", "webm", "mpeg", "mpg", "m4v", "3gp", "ogv", "ts", "vob"
[String[]]$pictureFormat = "jpg", "jpeg", "png", "gif", "bmp", "tiff", "tif", "webp", "heic", "heif", "raw", "cr2", "nef", "arw", "svg", "ico"
[String[]]$documentFormat = "pdf", "doc", "docx", "odt", "rtf", "txt", "csv", "xls", "xlsx", "ods", "ppt", "pptx", "odp", "md", "html", "xml"

$filesInFolder = Get-ChildItem -Path "$($PSScriptRoot)" -File

foreach($file in $filesInFolder){
    $extension = $file.Extension.TrimStart('.').ToLower()

    if ($videoFormat -contains $extension){
        Move-Item -Path $file.FullName -Destination "$($PSScriptRoot)/videos/$($file.Name)"
    }

    elseif ($pictureFormat -contains $extension) {
        Move-Item -Path $file.FullName -Destination "$($PSScriptRoot)/pictures/$($file.Name)"
    }

    elseif ($documentFormat -contains $extension) {
        Move-Item -Path $file.FullName -Destination "$($PSScriptRoot)/documents/$($file.Name)"
    }
    
}