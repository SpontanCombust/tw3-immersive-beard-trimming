call variables.bat

set PACKED_DLC_CONTENT=%PACKED%\DLC\dlc%MOD_NAME%\content


cd %WCC_DIR%

:: pack
%WCC% pack -dir=%DLC_BUNDLE% -outdir=%PACKED_DLC_CONTENT%

:: metadata store
%WCC% metadatastore -path=%PACKED_DLC_CONTENT%

:: texture cache
%WCC% buildcache textures -db=%DLC_BUNDLE%\cook.db -basedir=%DLC_TEXTURE_CACHE% -platform="pc" -out=%PACKED_DLC_CONTENT%\texture.cache