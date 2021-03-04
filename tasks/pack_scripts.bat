@echo off

:: Enable non ascii characters
chcp 65001

set MOD_NAME="modBeardTrimming"

set FILES="..\files"
set PACKED="..\packed"

xcopy /YS %FILES%\Mod\scripts %PACKED%\Mods\%MOD_NAME%\content\scripts

::pause
