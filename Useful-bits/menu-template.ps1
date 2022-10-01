Do{

## Menu Options
Write-Host "This is the title of the Menu"
Write-Host "1 - First Option"
Write-Host "q - Quit"

## Menu response options with switch to go back to top

If($menu = Read-Host "Please enter 1 to 1:"){
Switch($menu){

## Menu responses
1 {
}

## End of Switch, Q to quit otherwise go back to the start
} }}until($menu -eq 'q')