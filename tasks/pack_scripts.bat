@echo off

:: Enable non ascii characters
chcp 65001

set MOD_NAME="modBeardTrimming"

set FILES="D:\Przemek\Witcher3Modding\Projects\TW3ImmersiveBeardTrimming\files"
set PACKED="D:\Przemek\Witcher3Modding\Projects\TW3ImmersiveBeardTrimming\packed"

xcopy /YS %FILES%\Mod\scripts %PACKED%\Mods\%MOD_NAME%\content\scripts

::pause
