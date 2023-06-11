@echo off
@title %1

echo '[Netu.tv Downloader]'
echo.

set title=%1
set link=%2
set dir=C:\Users\tsaty\Downloads\Video

REM echo %*
set _tail=%*
call set _tail=%%_tail:*%1=%%
REM echo %_tail%

echo.
echo Title: %title%
echo.
echo Path: Downloads\Video\%title%.mp4
echo.
echo Link: %link%
echo.
echo Arguments: %*
echo.

"C:\Users\tsaty\Downloads\N_m3u8DL-RE.exe" %_tail% --save-dir "%dir%" --save-name %title%

pause