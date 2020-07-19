# Setup-Script-Guide
How to create a script for installations, restoring settings for after reinstallation of Windows.

Preparations:
  - Create a "files" folder and a bat file.
  - Copy your installations to files. Check if it has silent install method. You can use powershell to look for parameters:
```
something.exe /?
```
  - Probably you wont use that program without changing settings so you gotta backup its settings. Look inside:
```
Regedit: HKEY_CURRENT_USER\Software
         HKEY_LOCAL_MACHINE\SOFTWARE
File Paths: Installation Folder
            Documents
            C:\Users\YOURNAME\AppData subfolders
            C:\ProgramData
```

Tips:
  - I recommend using portable software for your general usage as much as you can.
