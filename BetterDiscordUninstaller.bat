



@echo off

title BetterDiscordUninstaller

::grabs the number of the latest discord Stable Version
dir "%AppData%\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversion.txt"
set /p discord_version=<"%TEMP%\discordversion.txt"
del /f "%TEMP%\discordversion.txt"


::grabs the number of the latest discord Canary Version
dir "%AppData%\discordCanary" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversionCanary.txt"
set /p discord_versionCanary=<"%TEMP%\discordversionCanary.txt"
del /f "%TEMP%\discordversionCanary.txt"


::grabs the number of the latest discord PTB Version
dir "%AppData%\discordPTB" /ad /b | findstr "\<[0-9]\>" |   sort /r 1>"%TEMP%\discordversionPTB.txt"
set /p discord_versionPTB=<"%TEMP%\discordversionPTB.txt"
del /f "%TEMP%\discordversionPTB.txt"


:: tests if BD exists
if exist %AppData%\BetterDiscord start %b2eincfilepath%\BetterDiscord.vbs
if exist %AppData%\BetterDiscord goto options
if NOT exist %AppData%\BetterDiscord start %b2eincfilepath%\noBetterDiscord.vbs
if NOT exist %AppData%\BetterDiscord goto done







::asks if they wannna delete the folder or not
:options
@echo off
cls
echo.
echo Select a option:
echo =============
echo.
echo 1) Delete the BetterDiscord Roaming  folder (will delete plugins, themes, options, etc)
echo 2) Leave the Roaming folder (BetterDiscord will still be deleted but plugins, themes, options, etc will stay)
echo 3) Exit the uninstaller
echo.
set /p web=Type option:
if "%web%"=="1" goto BDRoaming
if "%web%"=="2" goto BDetect
if "%web%"=="3" goto Done










:BDRoaming
if exist %AppData%\discord\%discord_version% rmdir /s /q %appdata%\BetterDiscord 
goto BDetect

:BDetect
if exist %AppData%\discord\%discord_version% goto BDstable
if exist %AppData%\discordCanary\%discord_versionCanary% goto BDCanary
if exist %AppData%\discordPTB\%discord_versionPTB% goto BDPTB



::deletes BD stable
:BDstable
TASKKILL /IM discord.exe /F 
rmdir /s /q %appdata%\discord\%discord_version%\modules\discord_desktop_core\core
del %appdata%\discord\%discord_version%\modules\discord_desktop_core\index.js
del %appdata%\discord\%discord_version%\modules\discord_desktop_core\index.js.old  
xcopy %b2eincfilepath%\index.js %AppData%\discord\%discord_version%\modules\discord_desktop_core /Y
start %localAppData%\Discord\app-%discord_version%\discord.exe
goto cleanup
 


::deletes BD Canary
:BDCanary
TASKKILL /IM discordCanary.exe /F 
rmdir /s /q %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\core 
del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\index.js
del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\index.js.old
xcopy %b2eincfilepath%\index.js %AppData%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core 
start %localAppData%\DiscordCanary\app-%discord_versionCanary%\discordCanary.exe
goto cleanup



::deletes BD PTB
:BDPTB
TASKKILL /IM discordPTB.exe /F 
rmdir /s /q %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\core 
del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\index.js
del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\index.js.old
xcopy %b2eincfilepath%\index.js %AppData%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core 
start %localAppData%\DiscordPTB\app-%discord_versionPTB%\discordPTB.exe
goto cleanup



::cleans up and runs the final scripts
:cleanup
title Finished
start %b2eincfilepath%\done.vbs
rem Wait %5000%
start "" "https://discordapp.com/invite/0Tmfo5ZbORBSfCjI"
:done
pause


