call .\tasks\variables.bat


echo Parsing menu using Mod Settings Framework parser...

%MSF_PARSER% "%MOD_MENUS%\ImmersiveBeardTrimming.xml" -o "%MOD_SCRIPTS%\local\immersive_beard_trimming\settings.ws"