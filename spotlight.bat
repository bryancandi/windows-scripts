:: Copy the current Windows 11 desktop spotlight wallpaper to user directory.
:: Default save directory: C:\Users\User\Pictures\Spotlight
:: Files are named: spotlight_i++.jpg

@echo off

setlocal enabledelayedexpansion

set "src=%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper"
set "dest=%USERPROFILE%\Pictures\Spotlight"

set i=1

:loop
set "file=%dest%\spotlight_!i!.jpg"
if exist "!file!" (
    set /a i+=1
    goto loop
)

copy "%src%" "!file!"

echo Saved as !file!
