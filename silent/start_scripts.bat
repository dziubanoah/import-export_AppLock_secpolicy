@echo off

:: Prüfen, ob wir als Administrator laufen
net session >nul 2>&1

if %errorlevel% neq 0 (
    echo Fordere Administratorrechte an...
    powershell.exe -NoProfile -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Als Administrator gestartet.
echo.

echo Starte Script 1...

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0export_AppLock_execute_rules.ps1"