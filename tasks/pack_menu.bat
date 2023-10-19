call .\tasks\variables.bat


echo Packing the menu...

xcopy /YSi "%MOD_MENUS%" "%PACKED%\bin\config\r4game\user_config_matrix\pc"
