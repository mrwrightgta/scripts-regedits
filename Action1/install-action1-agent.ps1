#ACTION1 INSTALL

#Run as admin 
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

Do{

  ## Menu Options
  Write-Host "What would you like to do"
  Write-Host "1 - Install Action1"
  Write-Host "2 - Uninstall Action1"
  Write-Host "q - Quit"
  
  ## Menu response options with switch to go back to top
  
  If($menu = Read-Host "Please enter 1 to 2:"){
  Switch($menu){
  
  ## Menu responses
  1 {
    ## Install MSI for Action1 Silently

    $MYMSI="C:\Users\$env:USERNAME\Downloads\scripts-regedits-main\Action1\Action1.msi"
    $MYARGS="/I $MYMSI /quiet"
    Start-Process "msiexec.exe" -ArgumentList $MYARGS -wait -nonewwindow 
  }

  2 {
    ## Uninstall MSI
    msiexec.exe /x "C:\Users\$env:USERNAME\Downloads\scripts-regedits-main\Action1\Action1.msi"
  }
  
  ## End of Switch, Q to quit otherwise go back to the start
  } }}until($menu -eq 'q')