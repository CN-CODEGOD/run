


function consoleFileOpener {
    param($path)
    get-childitem -path $path `
    | out-consolegridview -OutputMode Single `
    | ForEach-Object {
        if ($_.PSIsContainer) {
            consoleFileOpener -path $_.fullname
        } else {
            start-process $_.fullname
        }  
    }
}
function conslewallpaperOpener {
    param (
        $path
    )
    Get-ChildItem -Path $path
    |Out-ConsoleGridView -OutputMode Single  `
    | ForEach-Object {
      &  "G:\Program Files\steam\steam\steamapps\common\wallpaper_engine\wallpaper64.exe" -control openWallpaper -file "$($_.FullName)"
    }
}

function ezsole {
 $ezsole = import-xml .\xml\ezsole.xml
| Out-ConsoleGridView -OutputMode Single
|%{
    & {$_.scriptblock}
}
 
}

function msshell {
    $msshell = import-xml .\xml\msshell.xml
    | Out-ConsoleGridView -OutputMode Single
|%{
    & {$_.scriptblock}
}
}


function add-script {
   
    
}
function run-script {
    b
    
}