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