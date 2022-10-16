@echo off
color 0A
set vfolder=%~dp0
set vpath=%vfolder%
if #%vfolder:~-1%# == #\# set vpath=%vfolder:~0,-1%
cd /D "%vpath%"

powershell.exe -Command "Invoke-WebRequest https://raw.githubusercontent.com/AndrewRathbun/KAPE-EZToolsAncillaryUpdater/main/KAPE-EZToolsAncillaryUpdater.ps1 -OutFile ""%vpath%\KAPE-EZToolsAncillaryUpdater.ps1"""
powershell.exe -ExecutionPolicy bypass -File "%vpath%\KAPE-EZToolsAncillaryUpdater.ps1" -netVersion 4

powershell.exe -Command "Invoke-WebRequest https://raw.githubusercontent.com/grayfold3d/Get-KapeModuleBinaries/master/Get-KapeModuleBinaries.ps1 -OutFile ""%vpath%\Get-KapeModuleBinaries.ps1"""
powershell.exe -ExecutionPolicy bypass -File "%vpath%\Get-KapeModuleBinaries.ps1" -Dest "%vpath%\Modules\Bin" -ModulePath "%vpath%\Modules"

pause