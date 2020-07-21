@echo off

echo RESTORING FIRST MINUTE CHANGES
cd "D:\Format\Files\"
regedit.exe /S "initial.reg"

echo INSTALLING VCREDIST
cd "D:\Format\Files\vcredist"
start /wait install_all.bat

echo SETTING KEYBOARD LIGHTS
cd "D:\Format\Files\"
COPY "klavye-isigi.exe" "C:\Users\Kaan\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\klavye-isigi.exe"
start klavye-isigi.exe

echo INSTALLING NVIDIA DRIVER
cd "D:\Format\Files\451.67"
start /wait setup.exe

echo DELETE UNNEEDED PROGRAMS
cd "D:\Programlar\Revo Uninstaller Pro"
start /wait RevoUninstallerProPortable.exe

echo SET UP FIREFOX
cd "D:\Programlar\Firefox"
start FirefoxPortable.exe
start Firefox Register.exe
pause

echo PIN SHORTCUTS
cd "D:\Format\Shortcuts"
COPY "D:\Format\Shortcuts\*.lnk" "C:\Users\Kaan\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"

echo INSTALLING INTERNET DOWNLOAD MANAGER
cd "D:\Format\Files\"
start /wait idm.exe
echo RESTORING IDM SETTINGS
regedit.exe /S "idm.reg"
echo STARTING IDM
C:
cd "C:\Program Files (x86)\Internet Download Manager"
start IDMan.exe
D:

echo INSTALLING WINRAR
cd "D:\Format\Files\"
start /wait winrar.exe

echo SETTING SHAREX
cd "D:\Programlar\ShareX\"
start ShareX.exe

echo SETTING MEM REDUCT
cd "D:\Programlar\Mem Reduct\"
start memreduct.exe

echo STOPPING WINDOWS SEARCH
sc config "WSearch" start=disabled
sc stop "WSearch"

echo INSTALLING DIRECTX
cd "D:\Format\Files\"
start /wait dxwebsetup.exe /Q

echo INSTALLING VS CODE
start /wait "vscode.exe" /VERYSILENT /NORESTART
echo RESTORING VS CODE SETTINGS
COPY "settings.json" "C:\Users\Kaan\AppData\Roaming\Code\User\settings.json"

echo SETTING NVIDIA CONTROL PANEL LANGUAGE
cd "D:\Format\Files\"
regedit.exe /S "nvidia.reg"

echo LAUNCHING DISCORD ONCE
cd "D:\Programlar\Discord"
start discord-portable.exe

echo ACTIVATING WINDOWS
cd "D:\Format\Files\"
start /wait consoleact.exe /win=act

echo MANUAL SETTINGS

echo PERFORMANCE SETTINGS
start /wait systempropertiesadvanced.exe

echo AUDIO SETTINGS
mmsys.cpl
pause

echo TIME AND DATE SETTINGS
intl.cpl
timedate.cpl
pause

echo TASK MANAGER ADJUSTMENTS
start /wait taskmgr.exe

echo MICROSOFT STORE SETTINGS
ms-windows-store:
pause

echo SET THUNDERBIRD AS DEFAULT
cd "D:\Programlar\Thunderbird"
start /wait ThunderbirdPortable.exe

echo ADDING POWER PLAN
cd "D:\Format\Files\"
powercfg /import "powerplan"
echo CHOOSE THE NEW PLAN
powercfg.cpl
pause

echo INSTALLING Riva Tuner Statistics Server
cd "D:\Format\Files\"
start /wait rtss-setup.exe
echo RESTORING RTSS SETTINGS
COPY "Config" "C:\Program Files (x86)\RivaTuner Statistics Server\Profiles\Config"
COPY "Global" "C:\Program Files (x86)\RivaTuner Statistics Server\Profiles\Global"
echo STARTING RTSS
C:
cd "C:\Program Files (x86)\RivaTuner Statistics Server\"
start rtss.exe
D:

echo INSTALL ADDITIONAL DRIVERS
cd "D:\Format\Files\SDIO"
start /wait SDIO_x64_R715.exe

echo NVIDIA SETTINGS
C:
cd "C:\Program Files\NVIDIA Corporation\Control Panel Client"
start /wait nvcplui.exe

echo RESTORE STEAM GAMES
cd "D:\Programlar\Steam\"
start steam.exe
pause

echo INSTALLING NEEDED PROGRAMS FOR UNITY ENGINE
start /wait "dotnetsdk.exe"  /install /quiet /norestart
start /wait "ndpdevpack.exe"  /install /quiet /norestart

echo INSTALL C# EXTENSION FOR VS CODE
cd "C:\Program Files\Microsoft VS Code"
start /wait Code.exe

echo SET UP UNITY HUB AND UNITY ENGINE
cd "D:\Programlar\Unity Hub"
start Unity Hub.exe
