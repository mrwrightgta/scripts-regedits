    ## Admin Account Setup
    {
        Read-Host "Here we are going to set up the default admin account and give it a password of your choice"

        $Password = Read-Host -AsSecureString "Please enter the password for the admin user, make it something you will remember"

        Get-LocalUser -Name "Administrator" | Enable-LocalUser
     
        $UserAccount = Get-LocalUser -Name "Administrator"
        $UserAccount | Set-LocalUser -Password $Password
        Read-Host "Done! Press enter to go back to the Main Menu"
        
    }