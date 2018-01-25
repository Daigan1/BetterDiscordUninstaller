::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcACDNWy7OpEZ++Pv4Pq7oEkIWusxa5va1riLMtwx71HwcIQJ32lZl9kIQg1abXI=
::fBE1pAF6MU+EWHreyHcjLQlHcACDNWy7OpEZ++Pv4Pq7oEkIWusxa5va1riLMtwd5WfhYYIoxF5Ti8gDHh8WaBC4Dg==
::fBE1pAF6MU+EWHreyHcjLQlHcACDNWy7OpEZ++Pv4Pq7oEkIWusxa5va1riLMtwX5UvhO4AvxRo=
::fBE1pAF6MU+EWHreyHcjLQlHcACDNWy7OpEZ++Pv4Pq7oEkIWusxa5va1riLMtwa5EHhbdgnxRo=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFB9VRQODAE+/Fb4I5/jH7e6SrEQTR/Y+dIPeyIiJL+8X1XbSYqkk1XVU1sIPA3s=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF65
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF65
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAlTi
::ZQ05rAF9IAHYFVzEqQISLQ9ASRamNXi5CacY3eby4fmTo0ERUfBf
::eg0/rx1wNQPfEVWB+kM9LVsJDCaHKH+/FJEV++v0/e6yrEQTR/Y+dIPeyNQ=
::fBEirQZwNQPfEVWB+kM9LVsJDCaHKH+/FJEV++v0/e6yrEQTR/Y+dIPeyNQ=
::cRolqwZ3JBvQF1fEqQIFJhJaXxCDMGepRpcZ/Pz+/aqjq14eW/A7GA==
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFB9VRQODAE+/Fb4I5/jH7e6SrEQTR/Y+dIPeyIisJfQH71fAfIUu2WhercUFAghMfx6nax16rHZH1g==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983

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


