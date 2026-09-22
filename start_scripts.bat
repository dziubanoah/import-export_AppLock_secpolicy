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

choice /C YN /M "Soll die secpol AppLock XML exportiert werden?"

if errorlevel 2 (
    echo Export uebersprungen.
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0export_AppLock_execute_rules.ps1"
)

echo.
echo Script 1 fertig.
echo Starte Script 2...

choice /C YN /M "Soll die secpol AppLock XML importiert werden?"

if errorlevel 2 (
    echo Import uebersprungen.
    pause
    exit /b
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0import_AppLock_execute_rules.ps1"
)

echo.
echo Fertig.
pause
