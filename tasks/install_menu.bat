call .\tasks\variables.bat


echo Installing menu...

xcopy /ysi "%PACKED%\bin" "%GAME_DIR%\bin"
