call variables.bat

:: first get rid of any old archives
del %PACKED%\*.zip

powershell -command "%cd%\zip_release.ps1 %MOD_NAME_FULL% %MOD_VERSION% %PACKED%"
