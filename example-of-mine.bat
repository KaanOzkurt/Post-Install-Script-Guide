@echo off
title Maxibir Post-Install Script

cd /D "D:\Format\Files\"

echo SETTING KEYBOARD LIGHTS
start klavye-isigi.exe
COPY "klavye-isigi.exe" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" /Y

echo RESTORING FIRST-MINUTE CHANGES
regedit.exe /S "initial.reg"

echo INSTALLING DIRECTX
start /wait dxwebsetup.exe /Q

echo INSTALLING VCREDIST
start /wait vcredist.exe /y

echo INSTALLING JAVA
msiexec /i openjdk8.msi ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome,FeatureIcedTeaWeb,FeatureJNLPFileRunWith,FeatureOracleJavaSoft /quiet /norestart
msiexec /i openjdk11.msi ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome,FeatureIcedTeaWeb,FeatureJNLPFileRunWith,FeatureOracleJavaSoft /quiet /norestart

echo STOPPING WINDOWS SEARCH
sc config "WSearch" start=disabled
sc stop "WSearch"

echo STOPPING PRINT SPOOLER
sc config "Spooler" start=disabled
sc stop "Spooler"

echo ACTIVATING WINDOWS
start /wait consoleact.exe /win=act

echo INSTALLING EASY7ZIP
start /wait easy7zip.exe /S
echo RESTORING 7ZIP SETTINGS
regedit.exe /S "easy7zip.reg"

echo INSTALLING NOTEPAD++
start /wait notepad.exe /S
echo SET NOTEPAD++ THEME (OBSIDIAN)
start /wait notepad++

echo SET UP EDGE
cd "D:\Programlar\Edge"
start /wait RegisterBrowser.exe
start /wait EdgeLauncher.exe

echo PIN SHORTCUTS
COPY "D:\Format\Shortcuts\*.lnk" "C:\Users\User\AppData\Roaming\OpenShell\Pinned" /Y

echo SETTING SHAREX
cd "D:\Programlar\ShareX\"
COPY "ShareX.lnk" "C:\Users\User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" /Y
start ShareX.exe

echo SETTING MEM REDUCT
cd "D:\Programlar\Mem Reduct\"
start memreduct.exe

echo ENABLING WINDOWS MEDIA PLAYER
dism /online /Enable-Feature /FeatureName:WindowsMediaPlayer

echo PERFORMANCE SETTINGS
start /wait systempropertiesadvanced.exe

echo TASK MANAGER ADJUSTMENTS
start /wait taskmgr.exe

echo NVIDIA SETTINGS
cd "C:\Program Files\NVIDIA Corporation\Control Panel Client"
start /wait nvcplui.exe

echo AUDIO SETTINGS
mmsys.cpl

echo POST-INSTALL DONE! PLEASE RESTART
pause
