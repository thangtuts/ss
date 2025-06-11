@echo off
setlocal

echo === Downloading sign-client ZIP ===
set "ZIP_URL=https://github.com/Viindoo/sign-client/archive/refs/heads/master.zip"
set "ZIP_FILE=%TEMP%\sign-client.zip"
powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_FILE%'"

if not exist "%ZIP_FILE%" (
    echo Download failed.
    exit /b 1
)

echo === Extracting ZIP to C:\ ===
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath 'C:\' -Force"

echo === Renaming extracted folder ===
move "C:\sign-client-master-master" "C:\sign-client-master" >nul 2>&1

echo === Running windows.bat installer ===
cd /d C:\sign-client-master\install_script
call windows.bat

echo === Done ===
pause
