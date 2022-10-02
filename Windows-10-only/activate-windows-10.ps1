#Run as admin 
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

Start-Process -FilePath "C:\Users\$env:USERNAME\Downloads\scripts-regedits-main\Windows-10-only\Activate.bat" -NoNewWindow

PAUSE