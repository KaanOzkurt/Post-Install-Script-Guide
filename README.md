# Setup-Script-Guide
How to create a script for installations, restoring settings for after reinstallation of Windows.

Preparations:
  - Create a "files" folder and a bat file "TheScript".
  - Copy your installations to files.
  - Open thescript.bat
  - 
  
  
Tips:
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
  - Include ```cd``` (change directory) in every step to ensure it works normally after you arrange thescript.
