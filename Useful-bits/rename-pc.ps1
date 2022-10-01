Write-Host "This script will rename the PC to your desired hostname:"
Write-Host "- "
Write-Host " "
Read-Host "Press Enter to continue or Ctrl + C to quit"

$hostname = Read-Host "Please enter new or re-enter existing hostname, e.g. WRIGHT-PC, and press enter"

Write-Host "Renaming PC ...."

Rename-Computer -NewName $hostname -Force -Passthru

Read-Host "Done! Press enter to continue and reboot the PC, NOTE:Reboot will start in 3 seconds"

Start-Sleep -s 3
Restart-Computer