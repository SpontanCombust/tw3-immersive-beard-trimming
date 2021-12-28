call variables.bat

set OUT_DIR=%PACKED%\Mods\mod%MOD_NAME%\content
set CSV_ENG=%MOD_STRINGS%\en.csv
set CSV_PL=%MOD_STRINGS%\pl.csv
set OTHER_LANGS=ar br cz de es esMX fr hu it jp kr ru tr zh


cd %W3STRINGS_ENCODER_DIR%

:: make sure output directory exists
if not exist %OUT_DIR% (
    mkdir %OUT_DIR%
)

:: encode ENG
if exist %CSV_ENG% (
    %W3STRINGS_ENCODER% -e %CSV_ENG% -i %MOD_ID%
    move %CSV_ENG%.w3strings %MOD_STRINGS%\en.w3strings

    :: create w3strings files for other languages based on file for ENG
    for %%l in (%OTHER_LANGS%) do (
        :: * at the end to assume target is a file
        xcopy /y %MOD_STRINGS%\en.w3strings %MOD_STRINGS%\%%l.w3strings*
    )
) else (
    echo "English strings CSV not found!"
)

:: encode PL
if exist %CSV_PL% (
    %W3STRINGS_ENCODER% -e %CSV_PL% -i %MOD_ID%
    move %CSV_PL%.w3strings %MOD_STRINGS%\pl.w3strings
) else (
    echo "Polish strings CSV not found!"
)

:: clean up and copy
del %MOD_STRINGS%\*.ws
xcopy /yi %MOD_STRINGS%\*.w3strings %OUT_DIR%
del %MOD_STRINGS%\*.w3strings
