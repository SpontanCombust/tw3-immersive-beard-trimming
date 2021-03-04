@echo off

:: Enable non ascii characters
chcp 65001

:: The Witcher 3 main directory
set W3INSTALL="D:\Przemek\Wiedźmin 3 - Edycja GOTY\The Witcher 3 Wild Hunt GOTY"

:: move and launch the game with debug support
cd %W3INSTALL%\bin\x64
scriptStudio.exe

::pause