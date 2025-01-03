
using namespace system.xml.linq

class game {
    [string]$name
    [string]$gamepath
    hidden [string]$path = "$psscriptroot\xml\game.xml"
}

class folderpath {
    [string]$folderpath
    [string]$name
    hidden [string]$path = "$psscriptroot\xml\folderpath.xml"
    [void] DoInit(    [pscustomobject]$pscustomobject){
        $pscustomobjectName= (($pscustomobject)|Get-Member -Type NoteProperty ).Name
        foreach($propertyName in $pscustomobjectName ) {

           $this.$Propertyname= $pscustomobject.$Propertyname
        }
    }
    script ($pscustomobject){
    $this.doinit($pscustomobject)
    }
    [object] save(){

        $object=[XElement]::new("object",
        [XAttribute]::new("name","folderpath"),
        [XElement]::new("property",[XAttribute]::new("name","folderpath"),$this.folderpath),
        [XElement]::new("property",[XAttribute]::new("name","name"),$this.name)

        )
        return $object.ToString()   
    }
}

class script {      
    [string]$scriptblock
    [string]$name
#1.add hidden path
hidden [string]$path = "$psscriptroot\xml\scripts.xml"


#2.init

[void] DoInit(    [pscustomobject]$pscustomobject){
        $pscustomobjectName= (($pscustomobject)|Get-Member -Type NoteProperty ).Name
        foreach($propertyName in $pscustomobjectName ){

           $this.$Propertyname= $pscustomobject.$Propertyname   
        }
    }

script ($pscustomobject){z
$this.doinit($pscustomobject)
}
#3.save method 
[object] save(){

    $object=[XElement]::new("object",
    [XAttribute]::new("type ","script"),
    [XElement]::new("property",[XAttribute]::new("name","scriptblock"),$this.scriptblock),
    [XElement]::new("property",[XAttribute]::new("name","name"),$this.name)

    )
    return $object.ToString()   
}



}

 

class clipboard {
    
[string]$clipboard
[string]$name
hidden [string]$path="c:\users\adminnistrator\my-modules\run\xml\clipboard.xml"
[void] DoInit(    [pscustomobject]$pscustomobject){
    $pscustomobjectName= (($pscustomobject)|Get-Member -Type NoteProperty ).Name
    foreach($propertyName in $pscustomobjectName ){ 

       $this.$Propertyname= $pscustomobject.$Propertyname
    }
}

script ($pscustomobject){
$this.doinit($pscustomobject)
}

[object] save(){

    $object=[XElement]::new("object",
    [XAttribute]::new("type","clipboard"),
    [XElement]::new("property",[XAttribute]::new("name","clipboard"),$this.clipboard),
    [XElement]::new("property",[XAttribute]::new("name","name"),$this.name)

    )
    return $object.ToString()   
}




}




# Create a PSCustomObject with properties for clipboard
$clipboardObject = [PSCustomObject]@{
    clipboard = "Sample clipboard text"
    name = "SampleName"
}

# Create an instance of the clipboard class
$clipboardInstance = [clipboard]::new()

# Initialize the instance with the PSCustomObject
$clipboardInstance.DoInit($clipboardObject)

# Save the instance to XML format
$clipboardXml = $clipboardInstance.save()

# Output the XML
$clipboardXml