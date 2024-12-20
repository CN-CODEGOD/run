

using namespace system.xml.linq

Class scriptNames : System.Management.Automation.IValidateSetValuesGenerator {
    [string[]] GetValidValues() {
   
$scriptNames=(import-xml $PSScriptRoot\xml\script.xml).name
        return [string[]] $scriptNames
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

script ($pscustomobject){
$this.doinit($pscustomobject)
}
#3.save method 
[object] save(){

    $object=[XElement]::new("object",
    [XAttribute]::new("name","script"),
    [XElement]::new("property",[XAttribute]::new("name","scriptblock"),$this.scriptblock),
    [XElement]::new("property",[XAttribute]::new("name","name"),$this.name)

    )
    return $object.ToString()   
}



}

 

class clipboard {
    
[string]$clipboard
[string]$name
hidden [string]$path="$psscriptroot\xml\clipboard.xml"
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
    [XAttribute]::new("name","clipboard"),
    [XElement]::new("property",[XAttribute]::new("name","clipboard"),$this.clipboard),
    [XElement]::new("property",[XAttribute]::new("name","name"),$this.name)

    )
    return $object.ToString()   
}


}



class shell {
    [string]$shell
    [string]$namle
    hidden[string]$path="$Psscriptroot\xml\shell.xml"

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
    [XAttribute]::new("name","shell"),
    [XElement]::new("property",[XAttribute]::new("name","shell"),$this.shell),
    [XElement]::new("property",[XAttribute]::new("name","name"),$this.name)

    )
    return $object.ToString()   
}

}   
