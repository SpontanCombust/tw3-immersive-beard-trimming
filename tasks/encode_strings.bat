@echo off

:: Enable non ascii characters
chcp 65001


set ENCODER="D:\Przemek\Witcher3Modding\W3String Encoder\w3strings.exe"
set OUT_DIR="D:\Przemek\Witcher3Modding\Projects\BeardTrimming\strings\w3strings"
set MOD_ID=4818
set CSV_ENG="D:\Przemek\Witcher3Modding\Projects\BeardTrimming\strings\csv\en.csv"
set CSV_PL="D:\Przemek\Witcher3Modding\Projects\BeardTrimming\strings\csv\pl.csv"
set OTHER_LANGS=ar br cz de es esMX fr hu it jp kr ru tr zh


:: encode ENG
%ENCODER% -e %CSV_ENG% -i %MOD_ID%
del %CSV_ENG%.w3strings.ws
move %CSV_ENG%.w3strings %OUT_DIR%\en.w3strings

:: encode PL
%ENCODER% -e %CSV_PL% -i %MOD_ID%
del %CSV_PL%.w3strings.ws
move %CSV_PL%.w3strings %OUT_DIR%\pl.w3strings

:: create w3strings files for other languages based on file for ENG
for %%l in (%OTHER_LANGS%) do (
    xcopy /Yi %OUT_DIR%\en.w3strings %OUT_DIR%\%%l.w3strings
)