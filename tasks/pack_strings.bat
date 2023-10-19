call .\tasks\variables.bat


echo Packing w3strings files...

set OUT_DIR=%PACKED%\Mods\mod%MOD_NAME%\content
set CSV_ENG=%MOD_STRINGS%\en.csv
set CSV_PL=%MOD_STRINGS%\pl.csv

:: make sure output directory exists
if not exist "%OUT_DIR%" (
    mkdir "%OUT_DIR%"
)

:: encode ENG
%W3STRINGSX% "%CSV_ENG%" -o "%OUT_DIR%" -l all

:: encode PL
%W3STRINGSX% "%CSV_PL%" -o "%OUT_DIR%" -l pl
