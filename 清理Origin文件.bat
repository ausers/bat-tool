@echo off
echo 开始清理Origin文件。。。
rd /q /s "%APPDATA%\Origin"
rd /q /s "%LOCALAPPDATA%\Origin"
echo 清理完成
pause