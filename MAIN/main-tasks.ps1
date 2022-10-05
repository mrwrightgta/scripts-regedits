## Main script that will eventually run all scripts needed 

#Run script as admin 
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}    

## Start of loop
Do{

    ## Menu Options
    Write-Host "Weclome to the time saver script"
    Write-Host "1 - Rename PC"
    Write-Host "2 - Admin Account Setup"
    Write-Host "3 - Activate Windows 10"
    Write-Host "4 - Activate Windows 11"
    Write-Host "5 - Action1"
    Write-Host "q - Quit"
    
    ## Menu response options with switch to go back to top
    
    If($menu = Read-Host "Please enter 1 to 4:"){
    Switch($menu){
    
                                 ## Menu responses
    ## Rename PC
    1 {Write-Host "This script will rename the PC to your desired hostname:"
    Write-Host "- "
    Write-Host " "
    Read-Host "Press Enter to continue or Ctrl + C to quit"
    
    $hostname = Read-Host "Please enter new or re-enter existing hostname, e.g. WRIGHT-PC, and press enter"
    
    Write-Host "Renaming PC ...."
    
    Rename-Computer -NewName $hostname -Force -Passthru
    
    Read-Host "Done! Press enter to continue and reboot the PC, NOTE:Reboot will start in 3 seconds"
    
    Start-Sleep -s 3
    Restart-Computer
    }

    ## Admin Account Setup
    2 {#Run script as admin 
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
    }
## Activate windows 10
    3{
      #Run as admin 
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
## Run the BATCH file
Start-Process -FilePath "C:\Users\$env:USERNAME\Downloads\scripts-regedits-main\Windows-10-only\Activate.bat" -NoNewWindow

PAUSE
    }
## Activate Windows 11
    4 {
      #Run as admin 
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
## Run the BATCH file
Start-Process -FilePath "C:\Users\$env:USERNAME\Downloads\scripts-regedits-main\Windows-11-only\Activate.bat" -NoNewWindow

PAUSE
    }

    ##Action1 Install/Uninstall options
    5 {
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
  Write-Host "3 - Re-open Main Menu(NOTE:you will need to close off this menu seperately)"
  Write-Host "q - Quit"
  
  ## Menu response options with switch to go back to top
  
  If($menu = Read-Host "Please enter 1 to 3:"){
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

  3 {
    ## Reload main Script
    
    Start-Process C:\Users\$env:USERNAME\Downloads\scripts-regedits-main\MrWright.ps1
  }
  
  ## End of Switch, Q to quit otherwise go back to the start
  } }}until($menu -eq 'q')
    }
    
    ## End of Switch, Q to quit otherwise go back to the start
    } }}until($menu -eq 'q')