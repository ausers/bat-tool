@echo off

:check
@echo off & tasklist /nh|find "WerFault.exe"
if %errorlevel%==0 (
taskkill /F /IM WerFault.exe && echo %date% %time% ,����������Ӧ���� >> restart_service.txt && goto check2
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
echo ********����ʼ����********
echo �������������� %date% %time% ,����ϵͳ��־ >> restart_service.txt
echo start cmd.exe -by> start.bat
echo exit >> start.bat
start start.bat
REM set /p=.<nul ����������Ļ���....
set /p=.<nul
for /L %%i in (1 1 10) do set /p a=.<nul & ping.exe /n 2 127.0.0.1>nul
echo .
del start.bat /Q
echo ********�����������********
goto check
 
:Mesage
echo %time% ������������,5���������.. 
ping localhost -n 5 >nul
goto check