@echo off

:check
@echo off & tasklist /nh|find "WerFault.exe"
if %errorlevel%==0 (
taskkill /F /IM WerFault.exe && echo %date% %time% ,出现了无响应窗口 >> restart_service.txt && goto check2
)else (
goto check2
)
:check2
@echo off & tasklist /nh|find "cmd.exe"
if %errorlevel%==1 (
goto res
)else (
goto Mesage
)
 
:res
echo %time% 
echo ********程序开始启动********
echo 程序重新启动于 %date% %time% ,请检查系统日志 >> restart_service.txt
echo start cmd.exe -by> start.bat
echo exit >> start.bat
start start.bat
REM set /p=.<nul 不换行在屏幕输出....
set /p=.<nul
for /L %%i in (1 1 10) do set /p a=.<nul & ping.exe /n 2 127.0.0.1>nul
echo .
del start.bat /Q
echo ********程序启动完成********
goto check
 
:Mesage
echo %time% 程序运行正常,5秒后继续检查.. 
ping localhost -n 5 >nul
goto check