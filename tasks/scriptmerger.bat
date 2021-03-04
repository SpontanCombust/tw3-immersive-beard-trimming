@echo off

:: Enable non ascii characters
chcp 65001

:: SM main directory
set SCRIPT_MERGER="D:\Przemek\Wiedźmin 3 - Edycja GOTY\W3SM"

:: move and launch
cd %SCRIPT_MERGER%
%SCRIPT_MERGER%\WitcherScriptMerger.exe

::pause