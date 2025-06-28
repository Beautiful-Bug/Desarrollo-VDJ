@echo off
setlocal

:: Ruta al archivo Skyrim.ini
set INI_PATH=%USERPROFILE%\Documents\My Games\Skyrim Special Edition\Skyrim.ini

:: Cambiar el idioma a SPANISH
echo Modificando Skyrim.ini...
powershell -Command "(Get-Content '%INI_PATH%') -replace 'sLanguage=.*', 'sLanguage=SPANISH' | Set-Content '%INI_PATH%'"

:: Asegurarse de que la cabecera [General] esté presente
findstr /C:"[General]" "%INI_PATH%" >nul
if errorlevel 1 (
    echo [General]>tempSkyrim.ini
    echo sLanguage=SPANISH>>tempSkyrim.ini
    type "%INI_PATH%" >>tempSkyrim.ini
    move /Y tempSkyrim.ini "%INI_PATH%" >nul
)

:: Hacer el archivo solo lectura
attrib +R "%INI_PATH%"

:: Lanzar Skyrim Special Edition
start "" "steam://rungameid/489830"

echo Skyrim lanzado con el idioma configurado en español.
pause
