@echo off

:: Enable non ascii characters
chcp 65001

set WCC_DIR="D:\\Przemek\\Witcher3Modding\\Modkit\\bin\x64\\"
set WCC="wcc_lite.exe"
set BUNDLE="D:\\Przemek\\Witcher3Modding\\Projects\\BeardTrimming\\files\\DLC\\Bundle\\"
set TEXTURE_CACHE="D:\\Przemek\\Witcher3Modding\\Projects\\BeardTrimming\\files\\DLC\\TextureCache\\"
set PACKED_DLC_CONTENT="D:\\Przemek\\Witcher3Modding\\Projects\\BeardTrimming\\packed\\DLC\\dlcBeardTrimming\\content\\"


cd %WCC_DIR%

:: cook
%WCC% cook -platform="pc" -outdir=%BUNDLE% -basedir=%TEXTURE_CACHE% -mod=%TEXTURE_CACHE%

:: pack
%WCC% pack -dir=%BUNDLE% -outdir=%PACKED_DLC_CONTENT%

:: metadata store
%WCC% metadatastore -path=%PACKED_DLC_CONTENT%

:: texture cache
%WCC% buildcache textures -db=%BUNDLE%cook.db -basedir=%TEXTURE_CACHE% -platform="pc" -out=%PACKED_DLC_CONTENT%texture.cache" 