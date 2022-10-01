    ## Admin Account Setup
        Write-Host "Here we are going to set up the default admin account and give it a password of your choice"

        $Password1 = Read-Host -AsSecureString "Please enter the password for the admin user, make it something you will remember"
        $Password2 = Read-Host -AsSecureString "Please confirm your password"

        Get-LocalUser -Name "Administrator" | Enable-LocalUser
     
        $UserAccount = Get-LocalUser -Name "Administrator"
        $UserAccount | Set-LocalUser -Password $Password