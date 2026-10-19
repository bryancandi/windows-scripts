:: Copy the current Windows 11 desktop Spotlight wallpaper to user directory.
:: Default save directory: %USERPROFILE%\Pictures\Spotlight
:: Attempt OneDrive path if default Pictures directory is not found.
:: Files are named: spotlight_i++.jpg

@echo off
setlocal enabledelayedexpansion

set "src=%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper"
if not exist "%src%" (
    goto src_not_found
)

set "dest=%USERPROFILE%\Pictures\Spotlight"
if exist "%dest%" (
    echo Using default Pictures path...
    goto continue
)

set "dest=%USERPROFILE%\OneDrive\Pictures\Spotlight"
if exist "%dest%" (
    echo Using OneDrive path...
    goto continue
)

goto dest_not_found

:continue
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
goto done

:src_not_found
echo Spotlight image not found on this system. Exiting.
goto done

:dest_not_found
echo Pictures directory not found on this system. Exiting.
goto done

:done
pause
