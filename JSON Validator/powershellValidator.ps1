<#
  Powershell JSON Validator Scipt
  Author: Stephen Hengeli <sbh5436@psu.edu>
  Date: February 19, 2020
  File: powershellValidator.ps1
  Description: Prompts the user for a filename and checks if it is valid JSON
  Dependencies:
      a.) Target File Must be in the 'JSON Validation' directory
      b.) Powershell Version -ge v.6
  OS Type: [Cross-Platform]
      a.) Windows: Run PS1 script from directory
      b.) MacOS/Linux: Ensure 'pwsh' is installed, Run the compatibility BASH script
#>

function Show-IntroSplash{
  Write-Host "##################################"
  Write-Host "######### JSON VALIDATOR #########"
  Write-Host "##################################"
}

function Get-FileName{
  $JSONFile = Read-Host "Please Enter the File Name to Validate"
  return $JSONFile
}

function Validate-JSONFile($JSONFile){
  $isValidJSON = Get-Content $JSONFile -Raw | Test-Json

  if($isValidJSON){
    $message = 101
  } else {
    $message = 404
  }
  return $message
}

function Show-Conclusion($status){
  if($status -eq 101){
    Write-Host "JSON File is [VALID]"
  } else {
    Write-Host "JSON File is [NOT VALID]"
    Write-Host "See Error Message..."
  }
}

Show-IntroSplash
Show-Conclusion(Validate-JSONFile(Get-FileName))
Write-Host ".....script terminated....."
