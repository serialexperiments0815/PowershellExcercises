# Calling 'Get-ChildItem' method for return of items in Folder.
# "./" In current directory.
# "-Filter *.PNG" Of the type PNG.

Get-ChildItem "./" -Filter *.PNG |

    # Calling 'ForEach-Object' loop method for iterating through returned files.
    ForEach-Object {

        # Declaring and defining $newName variable.
        # Consisting of "{0}/$_.BaseName/Original Name" "_" "{1:D4}/$i/4-digit-counter" "{2}/$_.Extension/original extension"  
        $newName = "{0}_{1:D4}{2}" -f $_.BaseName, $i, $_.Extension

        # Calling 'Rename-Item" method returns updated filename.
        Rename-Item $_.FullName -NewName $newName

        # Increment counter.
        $i++
    }    
