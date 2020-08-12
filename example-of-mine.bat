@echo off

D:
cd "D:\Format\Files\"

echo RESTORING FIRST MINUTE CHANGES
regedit.exe /S "initial.reg"

echo SETTING KEYBOARD LIGHTS
COPY "klavye-isigi.exe" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" /Y
start klavye-isigi.exe

echo STOPPING WINDOWS SEARCH
sc config "WSearch" start=disabled
sc stop "WSearch"

echo ACTIVATING WINDOWS
start /wait consoleact.exe /win=act

echo INSTALLING 7ZIP
start /wait 7zip.exe /S
echo RESTORING 7ZIP SETTINGS
regedit.exe /S "7zip.reg"

echo INSTALLING DIRECTX
start /wait dxwebsetup.exe /Q

echo INSTALLING JAVA
msiexec /i openjdk.msi ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome,FeatureIcedTeaWeb,FeatureJNLPFileRunWith,FeatureOracleJavaSoft /quiet /norestart
pause

echo INSTALLING VCREDIST
cd "D:\Format\Files\vcredist\"
start /wait install_all.bat

echo INSTALLING VS CODE
cd "D:\Format\Files\"
start /wait vscode.exe
echo RESTORING VS CODE SETTINGS
XCOPY "settings.json" "C:\Users\User\AppData\Roaming\Code\User\" /Y

echo SET UP FIREFOX
cd "D:\Programlar\Firefox"
start FirefoxPortable.exe
start FirefoxRegister.exe
pause

echo PIN SHORTCUTS
COPY "D:\Format\Shortcuts\*.lnk" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /Y
pause

echo SETTING SHAREX
cd "D:\Programlar\ShareX\"
COPY "ShareX.lnk" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" /Y
start ShareX.exe

echo SETTING MEM REDUCT
cd "D:\Programlar\Mem Reduct\"
start memreduct.exe

echo SET THUNDERBIRD AS DEFAULT
cd "D:\Programlar\Thunderbird"
start /wait ThunderbirdPortable.exe

echo RESTORE STEAM GAMES
cd "D:\Programlar\Steam\"
start steam.exe

C:

echo ENABLING WINDOWS MEDIA PLAYER
dism /online /Enable-Feature /FeatureName:WindowsMediaPlayer

echo PERFORMANCE SETTINGS
start /wait systempropertiesadvanced.exe

echo AUDIO SETTINGS
mmsys.cpl
pause

echo REGION SETTINGS
intl.cpl
pause

echo TASK MANAGER ADJUSTMENTS
start /wait taskmgr.exe

echo MICROSOFT STORE SETTINGS
ms-windows-store:
pause

echo NVIDIA SETTINGS
cd "C:\Program Files\NVIDIA Corporation\Control Panel Client"
start /wait nvcplui.exe

echo POST-INSTALL DONE! PLEASE RESTART
pause
