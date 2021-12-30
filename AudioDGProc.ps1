# Written notification message of purpose.
Write-Host "Setting Process ID and Affinity" -ForegroundColor Yellow -BackgroundColor Gray
# Details of process priority and processor affinity at start. Followed by application of changes.
Echo ">>>>>> DETAILS <<<<<<"
Write-Host "Before:"  -ForegroundColor Red -BackgroundColor White
Get-Process audiodg | Select-Object ProcessorAffinity
Get-Process audiodg | Format-Table -View priority
$Process = Get-Process audiodg; $Process.ProcessorAffinity=16; $Process.PriorityClass=128
# Old method for win32 object. Use if there are multiple instances of audiodg.exe running.
## Get-WmiObject Win32_process -filter 'name = "audiodg.exe"' | foreach-object { $_.SetPriority(128) } 
Write-Host "After:"  -ForegroundColor DarkGreen -BackgroundColor Gray
# Checking priority of items following
Get-Process audiodg | Select-Object ProcessorAffinity
Get-Process audiodg | Format-Table -View priority