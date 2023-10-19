call .\tasks\variables.bat


echo Installing w3strings files...

xcopy /ysi "%PACKED%\Mods\mod%MOD_NAME%\content\*.w3strings" "%GAME_DIR%\Mods\mod%MOD_NAME%\content\"