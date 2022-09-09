@echo off
cls
setlocal enabledelayedexpansion
Set "download=%USERPROFILE%\Downloads"
set /p "file=web3 File Path (Default is Download Folder) "
set /p "download=download path "
copy wget.exe %download%
cd %file%
cls
echo Loading...
@echo off
for /F "delims=" %%x in (File.web3) do (
set id=%%x
)
cls
echo Downloading...
set "link=!id!"
cd %download%
wget %link%
cls
DEL wget.exe -q -f
echo Downloaded!
pause