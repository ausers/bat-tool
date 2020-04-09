@echo off&TITLE 战网客户端修改
setlocal enabledelayedexpansion

echo= 命令1：修改为国际服登录器
echo= 
echo= 命令2：修改为国服登录器
echo=
choice /c 12
if %errorlevel%==2 (goto :cn)
if %errorlevel%==1 (goto :all)

:all
:: "CN",→ "CN;US;EU;KR",
set a=1
for /f "delims=" %%i in (%appdata%\Battle.net\Battle.net.config) do ( 
if !a!==32 ( goto set1 ) else ( set /A a=!a!+1 )
echo %%i>>%appdata%\Battle.net\Battle.net.config2
)
:set1
echo                 "AllowedRegions": "CN;US;EU;KR",>>%appdata%\Battle.net\Battle.net.config2
for /f "skip=32 delims=" %%i in (%appdata%\Battle.net\Battle.net.config) do echo %%i>>%appdata%\Battle.net\Battle.net.config2
xcopy /y /c /h /r "%appdata%\Battle.net\Battle.net.config2" "%appdata%\Battle.net\Battle.net.config" >nul
del %appdata%\Battle.net\Battle.net.config2
pause
exit

:cn
:: "CN;US;EU;KR",→ "CN",
set a=1
for /f "delims=" %%i in (%appdata%\Battle.net\Battle.net.config) do ( 
if !a!==32 ( goto set2 ) else ( set /A a=!a!+1 )
echo %%i>>%appdata%\Battle.net\Battle.net.config2
)
:set2
echo                 "AllowedRegions": "CN",>>%appdata%\Battle.net\Battle.net.config2
for /f "skip=32 delims=" %%i in (%appdata%\Battle.net\Battle.net.config) do echo %%i>>%appdata%\Battle.net\Battle.net.config2
xcopy /y /c /h /r "%appdata%\Battle.net\Battle.net.config2" "%appdata%\Battle.net\Battle.net.config" >nul
del %appdata%\Battle.net\Battle.net.config2
pause
exit