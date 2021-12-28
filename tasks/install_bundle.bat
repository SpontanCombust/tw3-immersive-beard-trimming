call variables.bat

set PACKED_DLC_CONTENT=%PACKED%\DLC\dlc%MOD_NAME%\content


:: only DLC bundled files
xcopy /ysi %PACKED_DLC_CONTENT% %GAME_DIR%\dlc\dlc%MOD_NAME%\content\