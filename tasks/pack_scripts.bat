call .\tasks\variables.bat

xcopy /YSi %MOD_SCRIPTS% %PACKED%\Mods\mod%MOD_NAME%\content\scripts
