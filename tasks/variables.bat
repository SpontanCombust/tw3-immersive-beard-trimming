@echo off

:: Enable non ascii characters
chcp 65001


:: Mod info
set MOD_NAME=ImmersiveBeardTrimming
set MOD_VERSION="2.0.0"
set MOD_ID=4818

:: Tools
set WCC_DIR="D:\Przemek\Witcher3Modding\Modkit\bin\x64\"
set WCC="wcc_lite.exe"
set W3STRINGS_ENCODER_DIR="D:\Przemek\Witcher3Modding\W3String Encoder"
set W3STRINGS_ENCODER="w3strings.exe"
set WOLVENKIT_DIR="D:\Przemek\Witcher3Modding\Wolvenkit"
set WOLVENKIT="WolvenKit.exe"
set SCRIPT_MERGER_DIR="D:\Przemek\Wiedźmin 3 - Edycja GOTY\W3SM"
set SCRIPT_MERGER="WitcherScriptMerger.exe"
set SCRIPT_STUDIO_DIR="D:\Przemek\Wiedźmin 3 - Edycja GOTY\The Witcher 3 Wild Hunt GOTY\bin\x64"
set SCRIPT_STUDIO="scriptStudio.exe"

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