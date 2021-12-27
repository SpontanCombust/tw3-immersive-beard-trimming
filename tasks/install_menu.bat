@echo off

:: Enable non ascii characters
chcp 65001

:: The Witcher 3 main directory
set W3MODMENUS="D:\Przemek\Wiedźmin 3 - Edycja GOTY\The Witcher 3 Wild Hunt GOTY\bin\config\r4game\user_config_matrix\pc"

:: Mod's "menu" folder
set MENU="D:\Przemek\Witcher3Modding\Projects\TW3ImmersiveBeardTrimming\menu"


:: Copy the menu
xcopy /YS %MENU% %W3MODMENUS%

::pause
