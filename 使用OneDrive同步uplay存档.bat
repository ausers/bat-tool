@echo off&TITLE Uplay存档OneDrive同步
echo=
echo. 1:添加同步（需要管理员权限）
echo=
echo. 2:删除同步
echo=
choice /c 12
if %errorlevel%==2 (goto :2)
if %errorlevel%==1 (goto :1)
:1
for /f "delims=SZ tokens=2" %%a in ('"reg query HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Uplay /v InstallLocation"') do (set uplay=%%a)
set "str=%uplay%" 
for /f "tokens=*" %%i in ("%str%") do (set uplay=%%i)
mklink /d "%USERPROFILE%\OneDrive\UPLAY" "%uplay%savegames"
pause
exit

:2
rmdir "%USERPROFILE%\OneDrive\UPLAY"
pause
exit