call .\tasks\variables.bat


echo Packing the bundle...

set PACKED_DLC_CONTENT=%PACKED%\DLC\dlc%MOD_NAME%\content


:: cook
if exist "%DLC_BUNDLE%\cook.db" (
    del "%DLC_BUNDLE%\cook.db"
)

cd %WCC_DIR%

%WCC% cook -platform="pc" -mod="%DLC_TEXTURE_CACHE%" -basedir="%DLC_TEXTURE_CACHE%" -outdir="%DLC_BUNDLE%"

:: pack
%WCC% pack -dir="%DLC_BUNDLE%" -outdir="%PACKED_DLC_CONTENT%"

:: metadata store
%WCC% metadatastore -path="%PACKED_DLC_CONTENT%"

:: texture cache
%WCC% buildcache textures -db="%DLC_BUNDLE%\cook.db" -basedir="%DLC_TEXTURE_CACHE%" -platform="pc" -out="%PACKED_DLC_CONTENT%\texture.cache"

cd %PROJECT_DIR%