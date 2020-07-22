@echo off

D:
echo RESTORING FIRST MINUTE CHANGES
cd "D:\Format\Files\"
regedit.exe /S "initial.reg"

echo SETTING KEYBOARD LIGHTS
COPY "klavye-isigi.exe" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\klavye-isigi.exe"
start klavye-isigi.exe

echo INSTALLING NVIDIA DRIVER
cd "D:\Format\Files\451.67 Standart"
start /wait setup.exe

echo SET UP FIREFOX
cd "D:\Programlar\Firefox"
start FirefoxPortable.exe
start FirefoxRegister.exe
pause

echo PIN SHORTCUTS
cd "D:\Format\Shortcuts"
COPY "D:\Format\Shortcuts\*.lnk" "C:\Users\User\AppData\Roaming\OpenShell\Pinned"

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
COPY "ShareX.exe" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ShareX.exe"
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
start /wait vscode.exe
echo RESTORING VS CODE SETTINGS
XCOPY "settings.json" "C:\Users\User\AppData\Roaming\Code\User\settings.json"

echo SETTING NVIDIA CONTROL PANEL LANGUAGE
regedit.exe /S "nvidia.reg"

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

echo INSTALL ADDITIONAL DRIVERS
cd "D:\Format\Files\SDIO"
start SDIO_auto.bat
pause

echo SET THUNDERBIRD AS DEFAULT
cd "D:\Programlar\Thunderbird"
start /wait ThunderbirdPortable.exe

echo SET UP POWER PLAN
D:
cd "D:\Format\Files\"
powercfg -import "D:\Format\Files\powerplan"
powercfg.cpl
pause

cd D:\Format\Files
echo INSTALLING RivaTuner Statistics Server
start /wait rtss.exe
echo RESTORING RTSS SETTINGS
XCOPY "Config" "C:\Program Files (x86)\RivaTuner Statistics Server\Profiles\Config"
XCOPY "Global" "C:\Program Files (x86)\RivaTuner Statistics Server\Profiles\Global"
echo STARTING RTSS
C:
cd "C:\Program Files (x86)\RivaTuner Statistics Server\"
start rtss.exe
D:

echo NVIDIA SETTINGS
C:
cd "C:\Program Files\NVIDIA Corporation\Control Panel Client"
start /wait nvcplui.exe

echo RESTORE STEAM GAMES
D:
cd "D:\Programlar\Steam\"
start steam.exe
pause

echo INSTALLING NEEDED PROGRAMS FOR UNITY ENGINE
d:
cd d:\format\files
start /wait dotnetsdk.exe /install /quiet /norestart
start /wait ndpdevpack.exe /install /quiet /norestart

C:
echo INSTALL C# EXTENSION FOR VS CODE
cd "C:\Program Files\Microsoft VS Code"
start Code.exe
pause

D:
echo SET UP UNITY HUB AND UNITY ENGINE
cd "D:\Programlar\Unity Hub"
start UnityHub.exe

echo POST-INSTALL DONE! PLEASE RESTART
pause
