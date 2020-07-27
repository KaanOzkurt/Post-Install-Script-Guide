@echo off

cd "D:\Format\Files\"

echo RESTORING FIRST MINUTE CHANGES
regedit.exe /S "initial.reg"

echo SETTING KEYBOARD LIGHTS
XCOPY "klavye-isigi.exe" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\klavye-isigi.exe"
start klavye-isigi.exe

echo INSTALLING INTERNET DOWNLOAD MANAGER
start /wait idm.exe
echo RESTORING IDM SETTINGS
regedit.exe /S "idm.reg"

echo INSTALLING WINRAR
start /wait winrar.exe

echo STOPPING WINDOWS SEARCH
sc config "WSearch" start=disabled
sc stop "WSearch"

echo INSTALLING DIRECTX
start /wait dxwebsetup.exe /Q

echo INSTALLING VS CODE
start /wait vscode.exe
echo RESTORING VS CODE SETTINGS
XCOPY "settings.json" "C:\Users\User\AppData\Roaming\Code\User\settings.json"

echo ACTIVATING WINDOWS
start /wait consoleact.exe /win=act

echo INSTALLING NEEDED PROGRAMS FOR UNITY ENGINE
start /wait dotnetsdk.exe /install /quiet /norestart
start /wait ndpdevpack.exe /install /quiet /norestart

echo INSTALLING HAMACHI
msiexec /i hamachi.msi /quiet /norestart
echo RESTORING HAMACHI SETTINGS
sc stop "Hamachi2Svc"
XCOPY "D:\Format\Files\LogMeIn Hamachi" "C:\Windows\ServiceProfiles\LocalService\AppData\Local\LogMeIn Hamachi"
sc start "Hamachi2Svc"
pause

echo INSTALLING NVIDIA DRIVER
cd "D:\Format\Files\451.67"
start /wait setup.exe

echo SET UP FIREFOX
cd "D:\Programlar\Firefox"
start FirefoxPortable.exe
start FirefoxRegister.exe
pause

echo PIN SHORTCUTS
cd "D:\Format\Shortcuts"
XCOPY "D:\Format\Shortcuts\*.lnk" "C:\Users\User\AppData\Roaming\OpenShell\Pinned"

echo SETTING SHAREX
cd "D:\Programlar\ShareX\"
XCOPY "ShareX.lnk" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ShareX.lnk"
start ShareX.exe

echo SETTING MEM REDUCT
cd "D:\Programlar\Mem Reduct\"
start memreduct.exe

echo INSTALL ADDITIONAL DRIVERS
cd "D:\Format\Files\SDIO"
start SDIO_auto.bat
pause

echo SET THUNDERBIRD AS DEFAULT
cd "D:\Programlar\Thunderbird"
start /wait ThunderbirdPortable.exe

echo RESTORE STEAM GAMES
cd "D:\Programlar\Steam\"
start steam.exe
sleep 3

echo SET UP UNITY HUB AND UNITY ENGINE
cd "D:\Programlar\Unity Hub"
start UnityHub.exe
sleep 3

C:

echo RESTORE OPEN SHELL SETTINGS
cd "C:\Program Files\Open-Shell"
start StartMenu.exe -settings
pause

echo STARTING IDM
cd "C:\Program Files (x86)\Internet Download Manager"
start IDMan.exe

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

echo SET UP POWER PLAN
powercfg -import "D:\Format\Files\powerplan"
powercfg.cpl
pause

echo NVIDIA SETTINGS
cd "C:\Program Files\NVIDIA Corporation\Control Panel Client"
start /wait nvcplui.exe

echo INSTALL C# EXTENSION FOR VS CODE
cd "C:\Program Files\Microsoft VS Code"
start Code.exe
pause

echo POST-INSTALL DONE! PLEASE RESTART
pause
