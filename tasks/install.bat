@echo off

:: Enable non ascii characters
chcp 65001

:: The Witcher 3 main directory
set W3INSTALL="D:\Przemek\Wiedźmin 3 - Edycja GOTY\The Witcher 3 Wild Hunt GOTY"

:: Mods "packed" folder
set PACKED="D:\Przemek\Witcher3Modding\Projects\TW3ImmersiveBeardTrimming\packed"


:: Copy Mods and DLC
xcopy /YS %PACKED%\Mods %W3INSTALL%\Mods
xcopy /YS %PACKED%\DLC %W3INSTALL%\dlc

::pause
