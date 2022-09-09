@echo off
setlocal enabledelayedexpansion
echo Prepareing...
del %cd%\dist\*.* /s /q
cls
set /p "filepath=Please Paste File Path "
cls
copy %filepath% %cd%\dist
node deploy.js
echo Creating File...
call :sub "%filepath%"
:sub
set filename %~nx1
for /F "delims=" %%x in (link.txt) do (
set id=%%x
)
set "link=!id!"
echo **please dont edit this file**> File.web3
echo %random%%random%%random%%random%%random%.Content.id>> File.web3
echo %link%%filepath%>> File.web3
DEL link.txt -q -f
cls
echo Create Completed (Dont Change Filename)
echo Path: %cd%\File.t0rrent
timeout /t 10