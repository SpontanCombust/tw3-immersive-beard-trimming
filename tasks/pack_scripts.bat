call .\tasks\variables.bat


echo Packing the scripts...

xcopy /YSi "%MOD_SCRIPTS%" "%PACKED%\Mods\mod%MOD_NAME%\content\scripts"
