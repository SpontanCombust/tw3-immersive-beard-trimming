call .\tasks\variables.bat

echo Installation cleanup...

rmdir /q /s "%GAME_DIR%\dlc\dlc%MOD_NAME%"
rmdir /q /s "%GAME_DIR%\Mods\mod%MOD_NAME%"