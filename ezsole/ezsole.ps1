


function add {
    param(
        $param
    )

    if ($param -like "http*") {
        $title = node .\GETtitle.js $param
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut("$Pwd\$title.lnk")
        $Shortcut.TargetPath = "$param"
        
        $Shortcut.WindowStyle = 1
        
        
        $Shortcut.Save()
        
    }
    

if (test-path "$param") {
  
    if ($param -like "http*") {
        $title = node .\GETtitle.js $param
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut("$pwd\$title.lnk")
        $Shortcut.TargetPath = "$param"
        $Shortcut.WindowStyle = 1
        $Shortcut.Save()
    }
    
    if ((Get-Item $param) -isnot [System.IO.DirectoryInfo] -and (test-path "$param")) {
        $title = (Get-Item "$param").BaseName
        $WScriptShell = New-Object -ComObject WScript.Shell
    
         $Shortcut = $WScriptShell.CreateShortcut("$pwd\$title.lnk") 
    
        $Shortcut.TargetPath = "$param"
        $Shortcut.WindowStyle = 1
        $Shortcut.Save()
    }

   
else {
    $title = (Get-Item "$param").BaseName
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut=$WScriptShell.CreateShortcut("$pwd\$title.lnk")
    $Shortcut.TargetPath = "$param"
    $Shortcut.WindowStyle = 1
    $Shortcut.Save()
}  
        
      
        
 
}

  
    
    
}



    function addwallpaper {
        param($path)

       
            $title =  (Get-Item "$path").BaseName
            $WScriptShell = New-Object -ComObject WScript.Shell
            $Shortcut = $WScriptShell.CreateShortcut("$pwd\Wallpaper.$title.lnk")
            $Shortcut.TargetPath = "G:\Program Files\steam\steam\steamapps\common\wallpaper_engine\wallpaper64.exe"
            
            # Make sure the $path is surrounded with quotes for handling spaces
            $Shortcut.Arguments = "-control openWallpaper -file `"$path`""
            
            $Shortcut.WindowStyle = 1
            $Shortcut.IconLocation = "G:\Program Files\steam\steam\steamapps\common\wallpaper_engine\wallpaper64.exe"
            $Shortcut.Save()
       
    }


    function getwallpaper {
  & "G:\Program Files\steam\steam\steamapps\common\wallpaper_engine\wallpaper64.exe" -control getWallpaper
    }
