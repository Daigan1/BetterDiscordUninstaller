


@echo off




::grabs the number of the latest discord Stable Version
dir "%AppData%\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversion.txt"

set /p discord_version=<"%TEMP%\discordversion.txt"

del /f "%TEMP%\discordversion.txt"

::grabs the number of the latest discord Canary Version
dir "%AppData%\discordCanary" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversionCanary.txt"

set /p discord_versionCanary=<"%TEMP%\discordversionCanary.txt"

del /f "%TEMP%\discordversionCanary.txt"

::grabs the number of the latest discord PTB Version
dir "%AppData%\discordPTB" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversionPTB.txt"

set /p discord_versionPTB=<"%TEMP%\discordversionPTB.txt"

del /f "%TEMP%\discordversionPTB.txt"

:: tests if BD exists
if exist %AppData%\BetterDiscord start %b2eincfilepath%\BetterDiscord.vbs 
if NOT exist %AppData%\BetterDiscord start %b2eincfilepath%\noBetterDiscord.vbs
if NOT exist %AppData%\BetterDiscord pause

::deletes BD stable
if exist %AppData%\discord\%discord_version% TASKKILL /IM discord.exe /F 
if exist %AppData%\discord\%discord_version% del %appdata%\discord\%discord_version%\modules\discord_desktop_core\core
if exist %AppData%\discord\%discord_version% del %appdata%\discord\%discord_version%\modules\discord_desktop_core\core\index.js
if exist %AppData%\discord\%discord_version% xcopy %b2eincfilepath%\index.js %AppData%\discord\%discord_version%\modules\discord_desktop_core 
if exist %AppData%\discord\%discord_version% del %appdata%\BetterDiscord
if exist %AppData%\discord\%discord_version% start %localAppData%\Discord\app-%discord_version%
 
::deletes BD Canary
if exist %AppData%\discordCanary\%discord_versionCanary% TASKKILL /IM discord.exe /F 
if exist %AppData%\discordCanary\%discord_versionCanary% del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\core
if exist %AppData%\discordCanary\%discord_versionCanary% del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\core\index.js
if exist %AppData%\discordCanary\%discord_versionCanary% xcopy %b2eincfilepath%\index.js %AppData%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core 
if exist %AppData%\discordCanary\%discord_versionCanary% del %appdata%\BetterDiscord
if exist %AppData%\discordCanary\%discord_versionCanary% start %localAppData%\DiscordCanary\app-%discord_versionCanary%

::deletes BD PTB
if exist %AppData%\discordPTB\%discord_versionPTB% TASKKILL /IM discord.exe /F 
if exist %AppData%\discordPTB\%discord_versionPTB% del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\core
if exist %AppData%\discordPTB\%discord_versionPTB% del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\core\index.js
if exist %AppData%\discordPTB\%discord_versionPTB% xcopy %b2eincfilepath%\index.js %AppData%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core 
if exist %AppData%\discordPTB\%discord_versionPTB% del %appdata%\BetterDiscord
if exist %AppData%\discordPTB\%discord_versionPTB% start %localAppData%\DiscordPTB\app-%discord_versionPTB%

::cleans up and runs the final scripts
start %b2eincfilepath%\done.vbs
rem Wait %5000%
start "" "https://discordapp.com/invite/0Tmfo5ZbORBSfCjI" 
pause


