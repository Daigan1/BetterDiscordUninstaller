
@echo off


::grabs the number of the latest discord version
dir "%AppData%\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversion.txt"

set /p discord_version=<"%TEMP%\discordversion.txt"

del /f "%TEMP%\discordversion.txt"



:: tests if BD exists
if exist %AppData%\BetterDiscord start %b2eincfilepath%\BetterDiscord.vbs nul 2>&1
if NOT exist %AppData%\BetterDiscord start %b2eincfilepath%\noBetterDiscord.vbs nul 2>&1






::deletes BD stable
if exist %AppData%\discord\%discord_version% TASKKILL /IM discord.exe /F nul 2>&1
rem Wait %3000%
del %AppData%\discord\%discord_version%\modules\discord_desktop_core\core /F /S /Q nul 2>&1
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\\discord\%discord_version%\modules\discord_desktop_core /F /S /Q /Y nul 2>&1
rem Wait %3000%
del %AppData%\discord\%discord_version%\modules\discord_desktop_core\index.js.old  /F /S /Q nul 2>&1   
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q nul 2>&1
start %localappdata%\Discord\app-%discord_version%\discord.exe nul 2>&1
rem Wait %5000%  


::deletes BD Canary
if exist %AppData%\discordCanary\%discord_version% TASKKILL /IM discordCanary.exe /F 2>&1
rem Wait %3000%
del %AppData%\discordCanary\%discord_version%\modules\discord_desktop_core\core /F /S /Q 2>&1
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\discordCanary\%discord_version%\modules\discord_desktop_core /F /S /Q /Y 2>&1
rem Wait %3000%
del %AppData%\discordCanary\%discord_version%\modules\discord_desktop_core\index.js.old /F /S /Q 2>&1   
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q 2>&1
start %localappdata%\DiscordCanary\app-%discord_version%\discordCanary.exe nul 2>&1
rem Wait %5000% 


::deletes BD PTB
if exist %AppData%\discordPTB\%discord_version% TASKKILL /IM discordPTB.exe /F 2>&1
del %AppData%\discordPTB\%discord_version%\modules\discord_desktop_core\core /F /S /Q 2>&1
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\discordPTB\%discord_version%\modules\discord_desktop_core /F /S /Q /Y 2>&1
rem Wait %3000%
del %AppData%\discordPTB\%discord_version%\modules\discord_desktop_core\index.js.old /F /S /Q 2>&1 
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q 2>&1
start %localappdata%\DiscordPTB\app-%discord_version%\discordPTB.exe nul 2>&1
rem Wait %5000%

 










::cleans up and runs the final scripts
start %b2eincfilepath%\done.vbs
rem Wait %9000%
start "" "https://discordapp.com/invite/0Tmfo5ZbORBSfCjI" 
rem Wait %7000%
pause


