:: Copy the current Windows 11 desktop spotlight wallpaper to user directory.
:: Default save directory: %USERPROFILE%\Pictures\Spotlight
:: If directory is not found try OneDrive path.
:: Files are named: spotlight_i++.jpg

@echo off
setlocal enabledelayedexpansion

set "src=%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper"
set "dest=%USERPROFILE%\Pictures\Spotlight"
if not exist "%dest\%" (
    echo Using OneDrive path...
    set "dest=%USERPROFILE%\OneDrive\Pictures\Spotlight"
)

set i=1

:loop
set "file=%dest%\spotlight_!i!.jpg"
if exist "!file!" (
    set /a i+=1
    goto loop
)

echo Copying Windows Spotlight wallpaper from %src%
copy "%src%" "!file!"
echo Saved as !file!

pause
