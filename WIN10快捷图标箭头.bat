@echo off&TITLE WIN10快捷图标箭头
:uac
echo.
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
echo WIN10快捷图标箭头
echo=
echo. 1:删除箭头
echo=
echo. 2:恢复箭头
echo=
choice /c 12
if %errorlevel%==2 (goto :2)
if %errorlevel%==1 (goto :1)


:1

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f

taskkill /f /im explorer.exe

attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"

del "%userprofile%\AppData\Local\iconcache.db" /f /q

start explorer

pause&exit


:2

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f

taskkill /f /im explorer.exe

attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"

del "%userprofile%\AppData\Local\iconcache.db" /f /q

start explorer

pause&exit