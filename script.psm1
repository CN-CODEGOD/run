
$completor = {
  param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

  (Get-ChildItem 'C:\Program Files\PowerShell\7\Modules\script\' -Directory ).name | Where-Object {
      $_ -like "$wordToComplete*"
  } | ForEach-Object {
        "'$_'"
  }
}
Register-ArgumentCompleter -CommandName Set-TimeZone -ParameterName Id -ScriptBlock $scriptBlock
Register-ArgumentCompleter -commandname run-script -parameterName name -scriptblock $completor
Register-ArgumentCompleter -commandname remove-script -parameterName name -scriptblock $completor


function new-script {


  [CmdletBinding()]
  param (
      [Parameter(Mandatory)]
      [string]
      $name
      ,# Parameter help description
      [Parameter(Mandatory)]
      [ScriptBlock]
      $scriptblock
  )
    
  
  try {
  md  "C:\Program Files\PowerShell\7\Modules\script\$name"
  $root = "C:\Program Files\PowerShell\7\Modules\script\$name"
  }
  catch {
  write-host ' folder already exist or folder has deleted'
  }
  
  
  
  
  
  class newscript {
  [string]$name
  [string]$scriptBlock
  
  newscript([string]$name,[string]$scriptBlock) {
  
  $this.name =$name
  $this.ScriptBlock=$scriptBlock
  }
  }
  $NewUsers = [newscript]::new($name,$scriptBlock)
  $NewUsers | export-clixml $root\xml.xml
  
  
  
    import-module 'C:\Program Files\PowerShell\7\Modules\script\script.psm1'


  

}


function run-script {
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $name 
)
$scriptBlock = (import-clixml  "C:\Program Files\PowerShell\7\Modules\script\$name\xml.xml" ).ScriptBlock

Invoke-Expression $scriptblock 

}
function remove-script {
  [CmdletBinding()]
  param (
      [Parameter()]
      [string]
      $name
  )
try {
 remove-item "C:\Program Files\PowerShell\7\Modules\script\$name" -force 

}
catch {
  'file does not exit' 
}


}

function get-script {
  [CmdletBinding()]
  param (
      [Parameter()]
      [string]
      $Name
  )
  
  
  try {
    Get-ChildItem "C:\Program Files\PowerShell\7\Modules\script" -recurse|Where-Object {$_.fullname -like "*xml*"}|Where-Object {$_.fullname -like "*$name*"}  | ForEach-Object {import-clixml $_.fullname}
  
  }
  catch {
    
  }
  
  
  }
    