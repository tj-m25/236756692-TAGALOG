@echo off
setlocal EnableDelayedExpansion

:UtilityMenu
echo.
echo Fundamental Windows Utilities
echo.
echo 1. ipconfig
echo 2. tasklist / taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
echo.
echo 0. Exit
echo.

set /p "choice=Enter the number of the utility you want to use (0 to exit): "

if "!choice!" == "1" goto ipconfig
if "!choice!" == "2" goto tasklist
if "!choice!" == "3" goto chkdsk
if "!choice!" == "4" goto format
if "!choice!" == "5" goto defrag
if "!choice!" == "6" goto find
if "!choice!" == "7" goto attrib
if "!choice!" == "0" goto end

goto UtilityMenu

:ipconfig
ipconfig
goto end

:tasklist
set /p "filter=Enter the process name to filter (or leave blank for all): "
tasklist | findstr /i "^[^ ]* %filter%"
set /p "kill=Enter the process ID to kill (or leave blank to return): "
if not "!kill!" == "" taskkill /PID !kill! /F
goto end

:chkdsk
set /p "drive=Enter the drive letter to check (e.g. C): "
chkdsk !drive!:
goto end

:format
set /p "drive=Enter the drive letter to format (e.g. C): "
set /p "fs=Enter the file system (e.g. NTFS): "
echo Warning: This operation will delete all data on the drive!
set /p "confirm=Type 'yes' to confirm: "
if /i "!confirm!" == "yes" format !drive!: /FS !fs!
goto end

:defrag
set /p "drive=Enter the drive letter to defragment (e.g. C): "
defrag !drive!:
goto end

:find
set /p "search=Enter the text to search for: "
set /p "file=Enter the file name or wildcard pattern (e.g. *.txt): "
find "!search!" "!file!"
goto end

:attrib
set /p "file=Enter the file name or wildcard pattern (e.g. *.txt): "
set /p "attributes=Enter the attributes to set (e.g. R H S): "
attrib +!attributes! "!file!"
goto end

:end