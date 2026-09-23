@echo off

:: Admin prüfen
net session >nul 2>&1

if %errorlevel% neq 0 (
    echo Fordere Administratorrechte an...
    powershell.exe -NoProfile -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Als Administrator gestartet.
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0rm_AppLock_exe_rules.ps1"

echo.
echo Fertig.
