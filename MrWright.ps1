## Main script that will eventually run all scripts needed 

Do{

    ## Menu Options
    Write-Host "Weclome to the time saver script"
    Write-Host "1 - Rename PC"
    Write-Host "2 - Admin Account Setup"
    Write-Host "q - Quit"
    
    ## Menu response options with switch to go back to top
    
    If($menu = Read-Host "Please enter 1 to 2:"){
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
    2 {
        Read-Host "Here we are going to set up the default admin account and give it a password of your choice"

        $Password = Read-Host -AsSecureString "Please enter the password for the admin user, make it something you will remember"

        Get-LocalUser -Name "Administrator" | Enable-LocalUser
     
        $UserAccount = Get-LocalUser -Name "Administrator"
        $UserAccount | Set-LocalUser -Password $Password
        Read-Host "Done! Press enter to go back to the Main Menu"
        
    }
    
    ## End of Switch, Q to quit otherwise go back to the start
    } }}until($menu -eq 'q')