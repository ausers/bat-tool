@echo off&TITLE Uplay�浵OneDriveͬ��
echo=
echo. 1:���ͬ������Ҫ����ԱȨ�ޣ�
echo=
echo. 2:ɾ��ͬ��
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