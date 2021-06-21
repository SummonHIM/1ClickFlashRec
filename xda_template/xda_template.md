# Easy Recovery Flasher for Picasso
Easy and fast download and flash recovery in one file!

```
 ____    ________            ____    ____    ____      
/\  _`\ /\_____  \          /\  _`\ /\  _`\ /\  _`\    
\ \ \L\_\/____//'/'         \ \ \L\ \ \ \L\_\ \ \/\_\  
 \ \  _\L    //'/'    _______\ \ ,  /\ \  _\L\ \ \/_/_ 
  \ \ \L\ \ //'/'___ /\______\\ \ \\ \\ \ \L\ \ \ \L\ \
   \ \____/ /\_______\/______/ \ \_\ \_\ \____/\ \____/
    \/___/  \/_______/          \/_/\/ /\/___/  \/___/ 

 ____    ___                     __                      
/\  _`\ /\_ \                   /\ \                     
\ \ \L\_\//\ \      __      ____\ \ \___      __   _ __  
 \ \  _\/ \ \ \   /'__`\   /',__\\ \  _ `\  /'__`\/\`'__\
  \ \ \/   \_\ \_/\ \L\.\_/\__, `\\ \ \ \ \/\  __/\ \ \/ 
   \ \_\   /\____\ \__/.\_\/\____/ \ \_\ \_\ \____\\ \_\ 
    \/_/   \/____/\/__/\/_/\/___/   \/_/\/_/\/____/ \/_/ 

                      EZ-RECFlasher
                   Design by SummonHIM.
         https://github.com/SummonHIM/EZ-RECFlasher
```
## Features
* Quick and easy CMD tools.
* Multi-language support: English and Chinese ( Simplified and Traditional).
* Auto download recovery and adb file on internet.
* Support TWRP and OrangeFox Recovery
### Notes:
Windows Powershell 5+ need! If you're using Win8.1 or lower, you might need to update the PowerShell version to 5+ by download Windows Management Framework 5.1 on microsoft.com

Multi-language not support Win8.1 or lower!
## Download
[Download here](Put URL in here)

#### CMD fast command
```
cd /d %USERPROFILE%\Documents & certutil -urlcache -split -f [Put URL in here] & start EZ-RECFlasher.bat
```
#### PowerShell fast command
```
cd $USERPROFILE\Documents ; Invoke-WebRequest "[Put URL in here]" -OutFile "EZ-RECFlasher.bat" ; Start-Process EZ-RECFlasher.bat
```
## USB Drive
If you don't have response on fastboot mode, maybe you need to install USB Drive by MiFlash Tools.

Download latest MiFlash Tools(MIUI China page)
## Source code
[GitHub](https://github.com/SummonHIM/EZ-RECFlasher)

Welcome to submit bug or new translate!
## Screenshots
[Put some screenshots in here]
## Credits
This tool design by @SummonHIM
