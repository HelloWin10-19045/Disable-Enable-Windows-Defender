@echo off
title 禁用Windows Defender工具
color 3f
cd \

title 禁用Windows Defender中...(1/4)
echo 正在禁用Windows Defender的防护功能...
sc config "WinDefend" start=disabled
sc config "WdNisDrv" start=disabled
sc config "WdNisSvc" start=disabled
sc config "SecurityHealthService" start=disabled
sc config "Sense" start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableSpecialRunningModes /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpyNetReporting /t REG_DWORD /d 0 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v ForceUpdateFromMU /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /F
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /FF
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MsMpEng.exe" /v debugger /t REG_SZ /d "null" /F
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MpCmdRun.exe" /v debugger /t REG_SZ /d "null" /F
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\NisSrv.exe" /v debugger /t REG_SZ /d "null" /F
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smartscreen.exe" /v debugger /t REG_SZ /d "null" /F
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SecurityHealthService.exe" /v debugger /t REG_SZ /d "null" /F
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SecurityHealthSystray.exe" /v debugger /t REG_SZ /d "null" /F
cls

title 禁用Windows Defender中...(2/4)
echo 正在禁用Windows Defender的任务计划程序...
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
cls

title 禁用Windows Defender中...(3/4)
echo 正在禁用Windows Defender的内存完整性...
bcdedit /set hypervisorlaunchtype off
cls

title 禁用Windows Defender中...(4/4)
echo 正在退出BCPE环境...
reg add "HKLM\SYSTEM\Setup" /v CmdLine /d "" /t REG_SZ /F
reg add "HKLM\SYSTEM\Setup" /v SetupPhase /d "0" /t REG_DWORD /F
reg add "HKLM\SYSTEM\Setup" /v SetupType /d "0" /t REG_DWORD /F
reg add "HKLM\SYSTEM\Setup" /v SystemSetupInProgress /d "0" /t REG_DWORD /F
cls

title 禁用Windows Defender完成
color 0f
echo 正在重新启动系统...
shutdown /r /f /t 1
del /f /q "%SystemDrive%\DisableMain.bat"
exit