

@echo off


::grabs the number of the latest discord Stable Version
dir "%AppData%\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversion.txt"

set /p discord_version=<"%TEMP%\discordversion.txt"

del /f "%TEMP%\discordversion.txt"
rem Wait %3000%






::grabs the number of the latest discord Canary Version
dir "%AppData%\discordCanary" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversionCanary.txt"

set /p discord_versionCanary=<"%TEMP%\discordversionCanary.txt"

del /f "%TEMP%\discordversionCanary.txt"
rem Wait %3000%





::grabs the number of the latest discord PTB Version
dir "%AppData%\discordPTB" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversionPTB.txt"

set /p discord_versionPTB=<"%TEMP%\discordversionPTB.txt"

del /f "%TEMP%\discordversionPTB.txt"
rem Wait %3000%






:: tests if BD exists
if exist %AppData%\BetterDiscord start %b2eincfilepath%\BetterDiscord.vbs 
if NOT exist %AppData%\BetterDiscord start %b2eincfilepath%\noBetterDiscord.vbs  
pause





::deletes BD stable
if exist %AppData%\discord\%discord_version% TASKKILL /IM discord.exe /F 
rem Wait %3000%
del %AppData%\discord\%discord_version%\modules\discord_desktop_core\core /F /S /Q nul 2>&1
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\discord\%discord_version%\modules\discord_desktop_core /F /S /Q /Y nul 2>&1
rem Wait %3000%
del %AppData%\discord\%discord_version%\modules\discord_desktop_core\index.js.old  /F /S /Q nul 2>&1   
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q nul 2>&1
start %localAppData%\Discord\app-%discord_version%
rem Wait %5000%  


::deletes BD Canary
if exist %AppData%\discordCanary\%discord_versionCanary% TASKKILL /IM discordCanary.exe /F 
rem Wait %3000%
del %AppData%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\core /F /S /Q 2>&1
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core /F /S /Q /Y 2>&1
rem Wait %3000%
del %AppData%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\index.js.old /F /S /Q 2>&1   
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q 2>&1
rem Wait %5000% 


::deletes BD PTB
if exist %AppData%\discordPTB\%discord_versionPTB% TASKKILL /IM discordPTB.exe /F 
del %AppData%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\core /F /S /Q 2>&1
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core /F /S /Q /Y 2>&1
rem Wait %3000%
del %AppData%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\index.js.old /F /S /Q 2>&1 
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q 2>&1
rem Wait %5000%

 










::cleans up and runs the final scripts
start %b2eincfilepath%\done.vbs
rem Wait %9000%
start "" "https://discordapp.com/invite/0Tmfo5ZbORBSfCjI" 
rem Wait %7000%
pause


