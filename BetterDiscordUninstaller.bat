

@echo off

title BetterDiscordUninstaller



::tos
start %b2eincfilepath%\TOS.txt
echo.
echo Select a option:
echo =============
echo.
echo 1) Please read the TOS and if you accept Type "Yes"
echo 2) Please read the TOS and if you do not accept Type "No"
echo.
echo =============
set /p option=Type option:
if "%option%"=="1" goto BDcheck
if "%option%"=="2" goto done








:: tests if BD exists
:BDcheck
if exist %AppData%\BetterDiscord start %b2eincfilepath%\BetterDiscord.vbs >nul 2>&1
if exist %AppData%\BetterDiscord goto options >nul 2>&1
if NOT exist %AppData%\BetterDiscord start %b2eincfilepath%\noBetterDiscord.vbs >nul 2>&1
if NOT exist %AppData%\BetterDiscord goto done >nul 2>&1



::asks if they wannna delete the folder or not
:options
cls
echo.
echo Select a option:
echo =============
echo.
echo 1) Delete the BetterDiscord Roaming  folder (will delete plugins, themes, options, etc)
echo 2) Leave the Roaming folder (BetterDiscord will still be deleted but plugins, themes, options, etc will stay)
echo 3) Exit the uninstaller
echo 4) Join the Offical BetterDiscord server for help
echo 5) View the project on GitHub
echo.
echo =============
set /p option=Type option:
if "%option%"=="1" goto BDRoaming
if "%option%"=="2" goto DiscordDetect
if "%option%"=="3" goto Done
if "%option%"=="4" start "" https://discordapp.com/invite/2HScm8j
if "%option%"=="4" goto done
if "%option%"=="5" start "" https://github.com/Daigan1/BetterDiscordUninstaller
if "%option%"=="5" goto done





:BDRoaming
rmdir /s /q %appdata%\BetterDiscord 
goto DiscordDetect

:DiscordDetect
cls
if exist %AppData%\discord\%discord_version% goto BDstable
if exist %AppData%\discordCanary\%discord_versionCanary% goto BDCanary
if exist %AppData%\discordPTB\%discord_versionPTB% goto BDPTB



::deletes BD stable
:BDstable
TASKKILL /IM discord.exe /F
::detect discord stable version
dir "%AppData%\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversion.txt"
set /p discord_version=<"%TEMP%\discordversion.txt"
del /f "%TEMP%\discordversion.txt"
::done detecting discord stable version
rmdir /s /q %appdata%\discord\%discord_version%\modules\discord_desktop_core\core
del %appdata%\discord\%discord_version%\modules\discord_desktop_core\index.js
del %appdata%\discord\%discord_version%\modules\discord_desktop_core\index.js.old  
xcopy %b2eincfilepath%\index.js %AppData%\discord\%discord_version%\modules\discord_desktop_core 
start %localAppData%\Discord\app-%discord_version%\discord.exe
goto cleanup
 


::deletes BD Canary
:BDCanary
TASKKILL /IM discordCanary.exe /F 
::detect discord Canary version
dir "%AppData%\discordCanary" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"%TEMP%\discordversionCanary.txt"
set /p discord_versionCanary=<"%TEMP%\discordversionCanary.txt"
del /f "%TEMP%\discordversionCanary.txt"
::done detecting discord Canary version
rmdir /s /q %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\core 
del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\index.js
del %appdata%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core\index.js.old
xcopy %b2eincfilepath%\index.js %AppData%\discordCanary\%discord_versionCanary%\modules\discord_desktop_core 
start %localAppData%\DiscordCanary\app-%discord_versionCanary%\discordCanary.exe
goto cleanup



::deletes BD PTB
:BDPTB
TASKKILL /IM discordPTB.exe /F
::detect discord PTB version
dir "%AppData%\discordPTB" /ad /b | findstr "\<[0-9]\>" |   sort /r 1>"%TEMP%\discordversionPTB.txt"
set /p discord_versionPTB=<"%TEMP%\discordversionPTB.txt"
del /f "%TEMP%\discordversionPTB.txt"
::done detecting Discord PTB version
rmdir /s /q %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\core 
del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\index.js
del %appdata%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core\index.js.old
xcopy %b2eincfilepath%\index.js %AppData%\discordPTB\%discord_versionPTB%\modules\discord_desktop_core 
start %localAppData%\DiscordPTB\app-%discord_versionPTB%\discordPTB.exe
goto cleanup



::cleans up and runs the final scripts
:cleanup
start %b2eincfilepath%\done.vbs
echo installer has finished you can now close the program
:done
pause


