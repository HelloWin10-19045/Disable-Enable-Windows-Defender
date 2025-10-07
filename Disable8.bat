@echo off
title 禁用Windows Defender工具
color 3f
cd \

title 禁用Windows Defender中...(1/3)
echo 正在禁用Windows Defender的防护功能...
sc config "WinDefend" start=disabled
sc config "WdNisDrv" start=disabled
sc config "WdNisSvc" start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableSpecialRunningModes /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /t REG_DWORD /d 0 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v ForceUpdateFromMU /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MsMpEng.exe" /v debugger /t REG_SZ /d "null" /F
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WdNisSvc.exe" /v debugger /t REG_SZ /d "null" /F
cls

title 禁用Windows Defender中...(2/3)
echo 正在禁用Windows Defender的任务计划程序...
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
cls

title 禁用Windows Defender中...(3/3)
echo 正在停止Windows Defender的服务和程序...
sc stop WinDefend
sc stop WdNisDrv
sc stop WdNisSvc
cls

title 禁用Windows Defender完成
color 0f
del /f /q "%0" >nul && echo 按任意键退出... && pause >nul && exit
exit