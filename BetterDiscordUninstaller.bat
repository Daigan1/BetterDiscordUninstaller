
@echo off


::grabs the number of the latest discord version
dir "%AppData%\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversion.txt"

set /p discord_version=<"%TEMP%\discordversion.txt"

del /f "%TEMP%\discordversion.txt"



:: tests if BD exists
if exist %AppData%\BetterDiscord start %b2eincfilepath%\BetterDiscord.vbs
if NOT exist %AppData%\BetterDiscord start %b2eincfilepath%\noBetterDiscord.vbs






::deletes BD stable
if exist %AppData%\discord\%discord_version% TASKKILL /IM discord.exe /F
rem Wait %3000%
del %AppData%\discord\%discord_version%\modules\discord_desktop_core\core /F /S /Q
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\\discord\%discord_version%\modules\discord_desktop_core /F /S /Q /Y
rem Wait %3000%
del %AppData%\discord\%discord_version%\modules\discord_desktop_core\index.js.old /F /S /Q      
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q
start %AppData%\Local\Discord\app-0.0.300\discord.exe
rem Wait %5000%  


::deletes BD Canary
if exist %AppData%\discordCanary\%discord_version% TASKKILL /IM discordCanary.exe /F
rem Wait %3000%
del %AppData%\discordCanary\%discord_version%\modules\discord_desktop_core\core /F /S /Q
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\discordCanary\%discord_version%\modules\discord_desktop_core /F /S /Q /Y
rem Wait %3000%
del %AppData%\discordCanary\%discord_version%\modules\discord_desktop_core\index.js.old /F /S /Q       
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q
start %localAppData%\DiscordCanary\app-0.0.300\discordCanary.exe
rem Wait %5000% 


::deletes BD PTB
if exist %AppData%\discordPTB\%discord_version% TASKKILL /IM discordPTB.exe /F
del %AppData%\discordPTB\%discord_version%\modules\discord_desktop_core\core /F /S /Q
rem Wait %3000%
XCOPY %b2eincfilepath%\index.js %AppData%\discordPTB\%discord_version%\modules\discord_desktop_core /F /S /Q /Y
rem Wait %3000%
del %AppData%\discordPTB\%discord_version%\modules\discord_desktop_core\index.js.old /F /S /Q       
rem Wait %5000%
del %AppData%\BetterDiscord /F /S /Q
start %AppData%\Local\DiscordPTB\app-0.0.300\discord.exe


 










::cleans up and runs the final scripts
start %b2eincfilepath%\done.vbs
rem Wait %9000%
start "" "https://discordapp.com/invite/0Tmfo5ZbORBSfCjI" 
rem Wait %7000%
pause


