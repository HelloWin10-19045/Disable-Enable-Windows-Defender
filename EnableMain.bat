@echo off
title 启用Windows Defender工具
color 3f
cd \

title 启用Windows Defender中...(1/4)
echo 正在启用Windows Defender的防护功能...
sc config "WinDefend" start=auto
sc config "WdNisDrv" start=demand
sc config "WdNisSvc" start=demand
sc config "Sense" start=demand
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 2 /F
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v Start /t REG_DWORD /d 3 /F
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v Start /t REG_DWORD /d 3 /F
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 3 /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableSpecialRunningModes /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /F
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MsMpEng.exe" /F
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MpCmdRun.exe" /F
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\NisSrv.exe" /F
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smartscreen.exe" /F
cls

title 启用Windows Defender中...(2/4)
echo 正在启用Windows Defender的任务计划程序...
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Enable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Enable
cls

title 禁用Windows Defender中...(3/4)
echo 正在禁用Windows Defender的内存完整性...
bcdedit /set hypervisorlaunchtype off
cls

title 启用Windows Defender中...(4/4)
echo 正在退出BCPE环境...
reg add "HKLM\SYSTEM\Setup" /v CmdLine /d "" /t REG_SZ /F
reg add "HKLM\SYSTEM\Setup" /v SetupPhase /d "0" /t REG_DWORD /F
reg add "HKLM\SYSTEM\Setup" /v SetupType /d "0" /t REG_DWORD /F
reg add "HKLM\SYSTEM\Setup" /v SystemSetupInProgress /d "0" /t REG_DWORD /F
cls

title 启用Windows Defender完成
color 0f
echo 正在重新启动系统...
shutdown /r /t 1
del /f /q "%SystemDrive%\EnableMain.bat"
exit