using namespace System.Xml.Linq
BeforeAll{


    class ADvar {
        [string]$name
        [string]$value
        [string]$description
        [string]$path = "$psscriptroot\xml\advar.xml"

        [void] DoInit([pscustomobject]$pscustomobject){
            $pscustomobjectName = (($pscustomobject) | Get-Member -Type NoteProperty).Name
            foreach ($propertyName in $pscustomobjectName) {
                $this.$propertyName = $pscustomobject.$propertyName
            }
        }

        ADvar ([pscustomobject]$pscustomobject){
            $this.DoInit($pscustomobject)
        }

        [object] save(){
            $object = [XElement]::new("object",
            [XAttribute]::new("name","advar"),
            [XElement]::new("property",[XAttribute]::new("name","name"),$this.name),
            [XElement]::new("property",[XAttribute]::new("name","value"),$this.value),
            [XElement]::new("property",[XAttribute]::new("name","description"),$this.description)
            )
            return $object.ToString()
        }

        [string] GetVariableName([object]$variable) {
            $variableName = (Get-Variable | Where-Object { $_.Value -eq $variable }).Name
            return $variableName
        }
    }
     }

    Describe "it test ADvar" {
        context "test first"{
            it "test the getvariableName"{

                $advar = [ADvar]::new([pscustomobject]@{
                    name = "test"
                    value = "test"
                    description = "test"
                })
    
                $advar.GetVariableName($advar) | Should -Be "advar"
            }
        }
      
    }
