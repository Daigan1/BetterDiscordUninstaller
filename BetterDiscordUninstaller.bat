


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
echo 1) Delete the BetterDiscord folder (will delete plugins, themes, options, etc)
echo 2) Leave the folder (BetterDiscord will still be deleted but plugins, themes, options, etc will stay)
echo.
set /p web=Type option:
if "%web%"=="1" goto BDFolder
if "%web%"=="2" goto BDnoFolder










:BDFolder
if exist %AppData%\discord\%discord_version% del %appdata%\BetterDiscord /Y
goto BDnoFolder

:BDnoFolder
if exist %AppData%\discord\%discord_version% goto BDstable
if exist %AppData%\discordCanary\%discord_versionCanary% goto BDCanary
if exist %AppData%\discordPTB\%discord_versionPTB% goto BDPTB



::deletes BD stable
:BDstable
TASKKILL /IM discord.exe /F 
del %appdata%\discord\%discord_version%\modules\discord_desktop_core\core /Y
del %appdata%\discord\%discord_version%\modules\discord_desktop_core\core\index.js /Y
xcopy %b2eincfilepath%\index.js %AppData%\discord\%discord_version%\modules\discord_desktop_core /Y
start %localAppData%\Discord\app-%discord_version%
goto cleanup
 


::deletes BD Canary
:BDCanary
TASKKILL /IM discord.exe /F 
del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\core /Y
del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\core\index.js /Y
xcopy %b2eincfilepath%\index.js %AppData%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core /Y
del %appdata%\BetterDiscord /Y
start %localAppData%\DiscordCanary\app-%discord_versionCanary% 
goto cleanup



::deletes BD PTB
:BDPTB
TASKKILL /IM discord.exe /F 
del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\core /Y
del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\core\index.js /Y
xcopy %b2eincfilepath%\index.js %AppData%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core /Y
del %appdata%\BetterDiscord /Y
start %localAppData%\DiscordPTB\app-%discord_versionPTB%
goto cleanup



::cleans up and runs the final scripts
:cleanup
start %b2eincfilepath%\done.vbs
rem Wait %5000%
start "" "https://discordapp.com/invite/0Tmfo5ZbORBSfCjI"
:done
pause


