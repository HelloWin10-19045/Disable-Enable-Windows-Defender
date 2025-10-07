@echo off
title 启用Windows Defender工具
color 3f
cd \

title 启用Windows Defender中...(1/3)
echo 正在启用Windows Defender的防护功能...
sc config "WinDefend" start=auto
sc config "WdNisDrv" start=demand
sc config "WdNisSvc" start=demand
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableSpecialRunningModes /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /F
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MsMpEng.exe" /F
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WdNisSvc.exe" /F
cls

title 启用Windows Defender中...(2/3)
echo 正在启用Windows Defender的任务计划程序...
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Enable
cls

title 启用Windows Defender中...(3/3)
echo 正在启动Windows Defender的服务和程序...
sc start WinDefend
cls

title 启用Windows Defender完成
color 0f
del /f /q "%0" >nul && echo 按任意键退出... && pause >nul && exit
exit