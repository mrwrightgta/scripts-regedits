
## Get user choice

Write-Host "Please enter the location you wish to add an exclusion to Defender"

$Exclusionpath = Read-Host "Enter path here"

Write-Output $Exclusionpath

#  Add Exclusion for user choice

Add-MpPreference -ExclusionPath = $Exclusionpath

PAUSE