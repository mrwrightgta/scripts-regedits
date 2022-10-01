   ## Admin Account Setup
        Read-Host "Here we are going to set up the default admin account and give it a password of your choice, Press Enter to continue"

        #Prompt the user for the password
        $password1 = Read-Host -AsSecureString "Please enter the password for the admin user, make it something you will remember"

        #Prompt the user for the password again
        $password2 = Read-Host -AsSecureString "Please enter the same password again"

        #check if password is blank
        if (!$password1){
        #if password is blank then display error message
        Read-Host"Your password cannot be blank" "Password change failed"
        }

        #checks if password do not match
        elseif(-not($password1 -eq $password2)){
        #if passwords do not match then display error message
        Read-Host "Your passwords did not match","Password change failed"
        }

        #if all checks come back good then attepmt to change the password
        else{
        try{

            Get-LocalUser -Name "Administrator" | Enable-LocalUser
     
            $UserAccount = Get-LocalUser -Name "Administrator"
            $UserAccount | Set-LocalUser -Password $Password
        }
        catch{
        $c = new-object -comobject wscript.shell
        $c.popup("Your password failed to reset. Please press CTRL+ALT+DEL on your keyboard and select the change password option",0,"Password change failed",0)
        }
        if (!$error){
        $d = new-object -comobject wscript.shell
        $d.popup("Your password has been sucessfully updated",0,"Password sucsefully updated",0)
        }}