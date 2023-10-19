:: if this script has already been called, immediately return from it
if not "%PROJECT_DIR%"=="" goto :eof


echo Settings variables...

:: Enable non ascii characters
chcp 65001

:: Mod info
set MOD_NAME=ImmersiveBeardTrimming
set MOD_VERSION="3.0.0"
set MOD_ID=4818


:: Tools

:: Their directories should be contained somewhere in the PATH environment variable
set MSF_PARSER=settings_parser.exe
set W3STRINGSX=w3stringsx.py

:: WCC can't be called from outside of its own directory, so we will be first CDing into it
:: WITCHER3MODKIT should be the environment variable pointing to the root directory of modkit
set WCC_DIR=%WITCHER3MODKIT%\bin\x64
set WCC=wcc_lite.exe

:: Full path to the game directory
:: WITCHER3 should be the environment variable pointing to it
set GAME_DIR=%WITCHER3%


:: Mod directory locations - no spaces allowed
set PROJECT_DIR=%cd%
set DLC_BUNDLE=%PROJECT_DIR%\files\DLC\Bundle
set DLC_TEXTURE_CACHE=%PROJECT_DIR%\files\DLC\TextureCache
set MOD_SCRIPTS=%PROJECT_DIR%\files\Mod\scripts
set MOD_STRINGS=%PROJECT_DIR%\strings
set MOD_MENUS=%PROJECT_DIR%\menu
set PACKED=%PROJECT_DIR%\packed


@echo off