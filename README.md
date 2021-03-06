# How to Create a Post Install Script
How to create a script (automation) for installations, restoring settings for after reinstallation of Windows.
Researching, computer knowledge and testing is required.

### Instructions:
  - Create a "files" folder and a bat file "TheScript".
  - Copy your installations to files.
  - Open thescript.bat
  - Add ```echo INSTALLING CHROME``` (example to inform about chrome installation) for every step and make steps a block.
  - Before starting an .exe or .bat access to its directory ```cd "D:\Format\Files\"```. If you gonna change between drives type ```c:``` or ```d:``` before using cd command.
  - To start an .exe or .bat ```start /wait installchrome.exe``` (/wait parameter is optional. it pauses thescript until the mentioned exe closed. So if you are installing something include /wait. And if you just starting a program then dont include it.)
  - To apply a .reg file ```regedit.exe /S "initial.reg"``` (/S parameter applies reg file without asking to apply.)
  - To copy a single file ```COPY "settings.json" "C:\Users\Kaan\AppData\Roaming\Code\User\ /Y"``` /Y parameter forces to overwrite the file if it exists. (the settings.json is in current directory thats why i didnt include whole path.)
  - To copy a folder ```COPY "D:\Format\Files\somechromefiles" "C:\Users\Kaan\AppData\Local\"```
  - You can /wait for .exe or .bat files to finish but not for .cpl and user actions. Add ```pause``` to wait for user to press a key to continue.
  - An example for user actions: open the sounds panel and wait for the user to change sound settings:
  ```
  mmsys.cpl
  pause
  ```
  - To stop a service: (first line disables start, second line stops the service. check ```services.msc``` about service names.)
  ```
  sc config "WSearch" start=disabled
  sc stop "WSearch"
  ```
  - To show up a folder ```start "D:\Format\Shortcuts"```
  - Rearrange the steps (sort)
  - Move the folder to a safe place (backup)
  - After reinstalling your Windows you can now run TheScript.bat AS ADMINISTRATOR
  
### Tips:
  - Check out [My Script](https://github.com/KaanOzkurt/Setup-Script-Guide/blob/master/example-of-mine.bat) to get an idea of what can be done.
  - Use portable software for your general usage as much as you can.
  - If you cant find any portable versions then look for a silent installs online. Also you can check if installation has silent install method. You can use powershell to look for parameters: ```something.exe /?```
  - Probably you wont use a program without changing its settings so you need to backup its settings. Look inside:
```
Regedit: HKEY_CURRENT_USER\Software
         HKEY_LOCAL_MACHINE\SOFTWARE
         
File Paths: Installation Folder
            Documents
            C:\Users\YOURNAME\AppData subfolders
            C:\ProgramData
```
  - Use something else than Notepad to edit .bat file.
  - Try out every step before adding to thescript.
  - Add ```@echo off``` to the top of thescript if you dont want console outputs while using thescript.
  - Include ```cd``` (change directory) in every step to ensure it works normally after you rearrange thescript.
  - Some installations (.exe) work differently. So you should use ```pause``` rather than ```start /wait installchrome.exe```
  - Some [shortcuts](https://www.tactig.com/complete-list-windows-10-run-commands/)
