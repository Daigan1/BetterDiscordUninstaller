@echo off
TASKKILL /IM discord.exe /F





dir "C:\Users\daiga\AppData\Roaming\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"C:\Users\%USERNAME%\Downloads\discordversion.txt"

set /p discord_currentLatestVersion=<"C:\Users\%USERNAME%\Downloads\discordversion.txt"

set discord_currentWorkingPath=C:\Users\%USERNAME%\AppData\Roaming\discord\%discord_currentLatestVersion%
del /f "C:\Users\%USERNAME%\Downloads\discordversion.txt"





















del %discord_currentWorkingPath%\modules\discord_desktop_core\core /F /S /Q
rem Wait %3000%
XCOPY C:\Users\%USERNAME%\Downloads\index.js %discord_currentWorkingPath%\modules\discord_desktop_core /F /S /Q /Y      
rem Wait %5000%
del C:\Users\%USERNAME%\AppData\Roaming\BetterDiscord /F /S /Q
rem Wait %5000%








dir "C:\Users\daiga\AppData\Roaming\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"C:\Users\%USERNAME%\Downloads\discordversion.txt"

set /p discord_currentLatestVersion=<"C:\Users\%USERNAME%\Downloads\discordversion.txt"

set discord_currentWorkingPath=C:\Users\%USERNAME%\AppData\Roaming\discordCanary\%discord_currentLatestVersion%
del /f "C:\Users\%USERNAME%\Downloads\discordversion.txt"







del %discord_currentWorkingPath%\modules\discord_desktop_core\core /F /S /Q
rem Wait %3000%
XCOPY C:\Users\%USERNAME%\Downloads\index.js %discord_currentWorkingPath% \modules\discord_desktop_core /F /S /Q /Y      
rem Wait %5000%
del C:\Users\%USERNAME%\AppData\Roaming\BetterDiscord /F /S /Q
rem Wait %5000%





dir "C:\Users\daiga\AppData\Roaming\discord" /ad /b | findstr "\<[0-9]\>" | sort /r 1>"C:\Users\%USERNAME%\Downloads\discordversion.txt"

set /p discord_currentLatestVersion=<"C:\Users\%USERNAME%\Downloads\discordversion.txt"

set discord_currentWorkingPath=C:\Users\%USERNAME%\AppData\Roaming\discordPTB\%discord_currentLatestVersion%
del /f "C:\Users\%USERNAME%\Downloads\discordversion.txt"


















del %discord_currentWorkingPath%\modules\discord_desktop_core\core /F /S /Q
rem Wait %3000%
XCOPY C:\Users\%USERNAME%\Downloads\index.js %discord_currentWorkingPath%\modules\discord_desktop_core /F /S /Q /Y      
rem Wait %5000%
del C:\Users\%USERNAME%\AppData\Roaming\BetterDiscord /F /S /Q
rem Wait %5000%










start C:\Users\%USERNAME%\Downloads\done.vbs
rem Wait %9000%
start "" "https://discordapp.com/invite/0Tmfo5ZbORBSfCjI" 
rem Wait %7000%
start C:\Users\%USERNAME%\AppData\Local\Discord\app-0.0.300\discord.exe
pause


