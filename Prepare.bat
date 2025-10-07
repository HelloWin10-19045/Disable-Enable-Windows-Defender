@echo off
:home
title 禁用或启用Windows Defender工具
color 3f
cd \
echo 1. 禁用Windows Defender
echo 2. 启用Windows Defender
echo.

set /p choice=请输入你的选择: 

if "%choice%"=="1" goto disable
if "%choice%"=="2" goto enable
if "%choice%" NEQ "1" if "%choice%" NEQ "2" goto error

:disable
cls
title 禁用Windows Defender工具
echo 按任意键禁用Windows Defender...(Windows 8.x无需重启电脑)
pause >nul
cls
ver | find "6.2." >nul &&  goto disable8
ver | find "6.3." >nul &&  goto disable8
copy /y "%temp%\DisableMain.bat" "%SystemDrive%\" >nul
reg add "HKLM\SYSTEM\Setup" /v CmdLine /d "cmd.exe /c %SystemDrive%\DisableMain.bat" /t REG_SZ /F >nul
reg add "HKLM\SYSTEM\Setup" /v SetupPhase /d "3" /t REG_DWORD /F >nul
reg add "HKLM\SYSTEM\Setup" /v SetupType /d "2" /t REG_DWORD /F >nul
reg add "HKLM\SYSTEM\Setup" /v SystemSetupInProgress /d "1" /t REG_DWORD /F >nul
cls
shutdown /r /f /t 5 && taskkill /f /im wlrmdr.exe
start mshta vbscript:msgbox("系统即将重启以禁用Windows Defender",64,"禁用Windows Defender工具")(window.close)
del /f /q "%temp%\NSudo.exe" >nul
del /f /q "%temp%\DisableMain.bat" >nul
del /f /q "%temp%\EnableMain.bat" >nul
del /f /q "%temp%\Disable8.bat" >nul
del /f /q "%temp%\Enable8.bat" >nul
del /f /q "%temp%\Prepare.bat" >nul
exit

:enable
cls
title 启用Windows Defender工具
echo 按任意键启用Windows Defender...(Windows 8.x无需重启电脑)
pause >nul
cls
ver | find "6.2." >nul && goto enable8
ver | find "6.3." >nul && goto enable8
copy /y "%temp%\EnableMain.bat" "%SystemDrive%\" >nul
reg add "HKLM\SYSTEM\Setup" /v CmdLine /d "cmd.exe /c %SystemDrive%\EnableMain.bat" /t REG_SZ /F >nul
reg add "HKLM\SYSTEM\Setup" /v SetupPhase /d "3" /t REG_DWORD /F >nul
reg add "HKLM\SYSTEM\Setup" /v SetupType /d "2" /t REG_DWORD /F >nul
reg add "HKLM\SYSTEM\Setup" /v SystemSetupInProgress /d "1" /t REG_DWORD /F >nul
cls
shutdown /r /f /t 5 && taskkill /f /im wlrmdr.exe
start mshta vbscript:msgbox("系统即将重启以启用Windows Defender",64,"启用Windows Defender工具")(window.close)
del /f /q "%temp%\NSudo.exe" >nul
del /f /q "%temp%\DisableMain.bat" >nul
del /f /q "%temp%\EnableMain.bat" >nul
del /f /q "%temp%\Disable8.bat" >nul
del /f /q "%temp%\Enable8.bat" >nul
del /f /q "%temp%\Prepare.bat" >nul
exit

:disable8
"%temp%\NSudo.exe" -U:T -P:E "%temp%\Disable8.bat"
del /f /q "%temp%\NSudo.exe" >nul
del /f /q "%temp%\DisableMain.bat" >nul
del /f /q "%temp%\EnableMain.bat" >nul
del /f /q "%temp%\Enable8.bat" >nul
del /f /q "%temp%\Prepare.bat" >nul
cls
exit

:enable8
"%temp%\NSudo.exe" -U:T -P:E "%temp%\Enable8.bat"
del /f /q "%temp%\NSudo.exe" >nul
del /f /q "%temp%\DisableMain.bat" >nul
del /f /q "%temp%\EnableMain.bat" >nul
del /f /q "%temp%\Disable8.bat" >nul
del /f /q "%temp%\Prepare.bat" >nul
cls
exit

:error
start mshta vbscript:msgbox("请重新输入！",64,"禁用或启用Windows Defender工具")(window.close)
cls
goto home