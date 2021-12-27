@echo off

:: Enable non ascii characters
chcp 65001

set W3INSTALL="D:\Przemek\Wiedźmin 3 - Edycja GOTY\The Witcher 3 Wild Hunt GOTY"
set STRINGS="D:\Przemek\Witcher3Modding\Projects\BeardTrimming\strings\w3strings"
set MOD_NAME="modBeardTrimming"


:: Copy scripts
xcopy /YS %STRINGS% %W3INSTALL%\Mods\%MOD_NAME%\content\

::pause
