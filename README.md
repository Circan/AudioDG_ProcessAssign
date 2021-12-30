# AudioDG_ProcessAssign
## The goal of this script is to fix the 'robotic clipping' issue with VoiceMeeter on certain multicore systems, especially with regard to microphones, and automate script execution.
#### → Your results may vary, but I hope it works for you!

###  How it works:
##### This repository contains a Powershell script which assigns AudioDG.exe a specific priority and logical processor affinity and is tested to work on Windows 10. 
######    → I have legacy code for older versions of Windows included, but have not tested it.
##### The batch file is utilized as an automation target for Windows Task Scheduler to execute the Powershell script every boot and only required for this function.
##### The batch file runs the PowerShell script with elevated permissions automatically. If you do not use the batch file, you must execute the Powershell script as Administrator ##

### Installation and Configuration:
##### 1) Download the .bat and .ps1 files.
##### 2) Place them in a new folder together. Any folder name and standard location should work as long as they are together.

##### 3) Open the folder containing Edit AudioDG_Start.bat to contain the file directory where the PowerShell script is located.
######    Example:
######    PowerShell -NoProfile -ExecutionPolicy Bypass -file C:\Users\<your user name here>\Documents\AudioDGProc\AudioDGProc.ps1

##### 4) There is a delay to allow drivers and configurations to load after Windows boot before changing affinity. You can adjust this timer by editing the value for:
######    Example:
######    timeout Time
######    Time may be any positive whole number.

#### 5) Open Task Scheduler and create a new BASIC TASK.
###### → Name the new task as it pleases you. I go with "AudioDGStartup".
###### → Set Trigger to "When I log on"
###### → Set Action to "Start a Program"
###### → Browse to the location of AudioDG_Start.bat and select it.
###### → Save the new Basic Task.
###### → Test the task by finding whatever you named it in the middle pane list and right-clicking Run. You can also reboot to test.

#### Additional Configuration:

#### You may edit the Powershell script to adjust the applied Priority:
###### $Process.PriorityClass=Value
###### Valid values: 
###### 64     →  Idle (Not recommended)
###### 16384  →  Below Normal (Not recommended)
###### 32     →  Normal (Fine to restore original settings, or restart)
###### 32768  →  Above Normal (Doesn't seem to be enough)
###### 128    →  High Priority (Works fine without other software running)
###### 256    →  Real Time (This seems to be the required setting to maximize compatibility)

#### You may edit the PowerShell script to adjust the selected processors: (I do not believe there is a meaningful difference between assigning a "hardware core" versus a logical core, only that the process uses a single core.)
###### $Process.ProcessorAffinity=Value
######    Core # = Value  = BitMask
######    Core 1 = 1      = 00000001
######    Core 2 = 2      = 00000010
######    Core 3 = 4      = 00000100
######    Core 4 = 8      = 00001000
######    Core 5 = 16     = 00010000
######    Core 6 = 32     = 00100000
######    Core 7 = 64     = 01000000
######    Core 8 = 128    = 10000000
######    All cores= 255  = 11111111
