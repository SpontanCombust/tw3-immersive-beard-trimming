@echo off

:: Enable non ascii characters
chcp 65001

:: SM main directory
set WOLVENKIT="D:\Przemek\Witcher3Modding\Wolvenkit"

:: move and launch
cd %WOLVENKIT%
%WOLVENKIT%\WolvenKit.exe

::pause