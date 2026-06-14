@echo off
cd /d "%~dp0"
echo Building Universal Process Memory Weaver Installer...
makensis.exe setup.nsi
echo Done! Installer created: UniversalMemoryWeaver_Setup.exe
pause