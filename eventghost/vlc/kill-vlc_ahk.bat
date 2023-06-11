@echo off

set VLC_AHK=vlc.ahk

for /f "tokens=2 delims= " %%A in ('tasklist /v ^| findstr /i "%VLC_AHK%"') do set PID=%%A

if not "%PID%"=="" (
    echo Terminating AutoHotkey script with PID %PID%...
    taskkill /PID %PID% /F
) else (
    echo AutoHotkey script not found.
)
