@echo off
echo Wait for audiodg.exe to launch.
timeout 5
PowerShell -NoProfile -ExecutionPolicy Bypass -file C:\Users\circa\Documents\Voice_Meeter_Proc_Start.ps1
echo Success!
timeout 2
exit