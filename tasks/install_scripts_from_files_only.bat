@echo off

:: Enable non ascii characters
chcp 65001

:: The Witcher 3 main directory
set W3INSTALL="D:\Przemek\Wiedźmin 3 - Edycja GOTY\The Witcher 3 Wild Hunt GOTY"

:: Mod's "files" folder
set FILES="D:\Przemek\Witcher3Modding\Projects\TW3ImmersiveBeardTrimming\files"

set MOD_NAME="modBeardTrimming"


:: Copy scripts
xcopy /YS %FILES%\Mod\scripts\ %W3INSTALL%\Mods\%MOD_NAME%\content\scripts\

::pause
