#Run script as admin 
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}    
    
    
    ## Admin Account Setup
    Write-Host "Lets setup the admin account and password on your machine"
    $pwd1 = Read-Host "Please enter the password you would like to set for your admin account" -AsSecureString
    $pwd2 = Read-Host "Please confirm password" -AsSecureString
    $pwd1_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pwd1))
    $pwd2_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pwd2))
    
    if ($pwd1_text -ceq $pwd2_text) {
        Get-LocalUser -Name "Administrator" | Enable-LocalUser
 
        $UserAccount = Get-LocalUser -Name "Administrator"
        $UserAccount | Set-LocalUser -Password $pwd1
        Write-Host "Passwords matched and have been changed"
        PAUSE
        } else {
        Write-Host "Passwords differ and the password was not set"
        PAUSE
        }
