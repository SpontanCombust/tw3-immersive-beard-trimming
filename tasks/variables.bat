@echo off

:: Enable non ascii characters
chcp 65001


:: Mod info
set MOD_NAME=ImmersiveBeardTrimming
set MOD_VERSION="3.0.0"
set MOD_ID=4818

:: Tools
:: Their directories should be contained in the PATH environment variable
set WCC="wcc_lite.exe"
set MSF_PARSER="settings_parser.exe"
set W3STRINGSX="w3stringsx.py"

:: Full path to the game directory
set GAME_DIR="D:\Przemek\Wiedźmin 3 - Edycja GOTY\The Witcher 3 Wild Hunt GOTY"

:: Full path to this project - no spaces allowed
set PROJECT_DIR=.

:: Mod directory locations
set DLC_BUNDLE=%PROJECT_DIR%\files\DLC\Bundle
set DLC_TEXTURE_CACHE=%PROJECT_DIR%\files\DLC\TextureCache
set MOD_SCRIPTS=%PROJECT_DIR%\files\Mod\scripts
set MOD_STRINGS=%PROJECT_DIR%\strings
set MOD_MENUS=%PROJECT_DIR%\menu
set PACKED=%PROJECT_DIR%\packed