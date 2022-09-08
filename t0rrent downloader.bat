@echo off
setlocal enabledelayedexpansion
Set "file=%USERPROFILE%\Downloads"
set /p file=t0rrent File Path (Default is Download Folder) 

timeout /t 1
cd %path%
cls
echo Loading...
@echo off
for /F "delims=" %%x in (File.t0rrent) do (
set id=%%x
)
ping 127.0.0.1 -n 6 > nul
cls
echo Downloading...
set "link=!id!"
cd %USERPROFILE%\Downloads
bitsadmin /transfer DownloadWorker /download /priority normal %link%
cls
echo Downloaded To download folder.
pause