@echo off
setlocal EnableDelayedExpansion


set "source=C:\text_files"
set "destination=Z:\archived_text_files"


if not exist "%destination%" mkdir "%destination%"

:
for /f "delims=" %%a in ('dir /b /a-d /o-d "%source%\*.txt"') do (
    set "filename=%%a"
    move "!source!\%%a" "%destination%"
)


for /f "delims=" %%a in ('dir /b /a-d /o-s "%destination%\*.txt"') do (
    set "filename=%%a"
    echo %%a
    set /a "size=%%~za / 1024"
    echo File size: !size! KB
    set /p "delete=Do you want to delete this file (Y/N)? "
    if /i "!delete!" == "Y" del "%destination%\!filename!"
    echo.
)

pause