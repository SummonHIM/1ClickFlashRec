
CHCP 65001
@ECHO OFF
setlocal enabledelayedexpansion
cls

powershell.exe $PSVersionTable> PSVer.info
for /f "skip=3 tokens=2 delims= " %%p in (PSVer.info) do (
    set PSVersion=%%p
    goto PSVerOver
)
:PSVerOver
del PSVer.info
if /i %PSVersion% LSS 5 (
    echo Your PowerShell version is too low. Please update your PowerShell to the latest version.
    echo Please download and install PowerShell 5.1 （Windows Management Framework 5.1）:
    echo https://www.microsoft.com/download/details.aspx?id=54616
    echo,
    echo Press any key to exit and open the WMF website...
    pause>nul
    start https://www.microsoft.com/download/details.aspx?id=54616
    exit
)

set SourcesListURL=https://raw.githubusercontent.com/SummonHIM/1ClickFlashRec/master/sample.sources.list
set ADBToolsURL=https://dl.google.com/android/repository/platform-tools-latest-windows.zip

for /f "tokens=3 delims=n*." %%p in ('ver^') do (
    set WindowsVer=%%p
)
if %WindowsVer% LSS 10 (
    set LangChoice=1
    goto QuickLangSetting
)

CLS
ECHO.***********************************************
ECHO.           Please select a language:
ECHO,
ECHO.               1.English
ECHO.               2.Vietnamese
ECHO.               3.Simplified Chinese
ECHO,
ECHO.***********************************************
CHOICE /C 123
set LangChoice=%errorlevel%

:QuickLangSetting
:** Language Config Start, DON'T DELETE EMPTY LINE **
if %LangChoice%==1 (
    COLOR 1F
    set language=english
    set LangPreTitle=Preparing:
    set LangGetSList=Getting sources list...
    set LangGetSListFailed=Download sources list failed！
    set LangPauseRetry=Press any key to retry...
    set LangChoiceRecVer=Please select a version you wanna flash:
    set LangYouSelected=You selected
    set LangDownExist=already exist.
    set LangDownSelected=Downloading selected recovery from
    set LangGetRECFailed=Download selected recovery failed！
    set LangDownADB=Downloading Android SDK Platform-Tools...
    set LangExpADB=Expanding Android SDK Platform-Tools...
    Set LangExistADB=Android SDK Platform-Tools already exist.
    set LangTitle=One click flash
    set LangRecInfo=RECOVERY INFORMATION
    set LangRecName=Recovery name
    set LangRecver=Recovery version
    set LangDevName=Device name
    set LangRecAuth=Author
    set LangRecDate=Release date
    set LangSuppMode=Support flash in normal mode and fastboot mode
    set LangPause=Press any key to continue
    set LangMenuMode=Your phone current mode
    set LangMenuNormalMode=Normal mode
    set LangMenuFastMode=Fastboot mode
    set LangMenuOtherMode=Other mode
    set LangMenuNumChoice=Please enter correct mode number
    set LangOtherReboot=Please reboot phone to
    set LangOtherPause=Press anykey to return back to main menu. It will automatically return if no key pressed in 6 secs.
    set LangOr=or
    set LangDevTypeTitle=Please connect your phone to your computer
    set LangDevTypeMakeSure=Make sure
    set LangDevTypeMakeSure1=Phone is unlocked bootloader
    set LangDevTypeMakeSure2=Phone is screen on
    set LangDevTypeMakeSure3=USB debugging is enable
    set LangDevTypeMakeSure4=Driver installed on PC
    set LangDevTypeMakeSure5=When the phone prompts USB debugging
    set LangDevTypeMakeSure5a=authorization, check Always and click Authorize
    set LangDevTypeMakeSure6=Phone in fastboot mode
    set LangDevTypeCheckTitle=Checking device connected
    set LangDevTypeCheckDesc1=If staying on this step too long, please check above information
    set LangDevTypeCheckDesc2=And restart the phone
    set LangDevTypeRestarting=The phone is restarting
    set LangFlashingDesc=If staying on this step too long, please check
    set LangFlashingDesc1=USB cable is connected
    set LangFlashingDesc2=Driver install correctly
    set LangFlashingDesc3=Phone is on fastboot mode
    set LangFlashingRec=Flashing recovery
    set LangFlashingRecDesc1=If OKAY is flash successfully, otherwise it fails
    set LangFlashingRecDesc2=If staying on this step too long, please restart tool
    set LangFlashFailed=SOMETHING WENT WRONG！
    set LangFlashFailedTitle=Flash failed
    set LangFlashFailedDesc1=Please check model is correct
    set LangFlashFailedDesc2=Make sure fastboot is correct
    set LangFlashFailedDesc3=Run the program again
    set LangFlashFailedDesc4=If still not successful, please contact author
    set LangFlashFailedDesc5=thank you for use this tool
    set LangFlashOverTitle=Flash recovery complete
    set LangFlashOverDesc1=The phone will restart to
    set LangFlashOverDesc2=Phone may restart 1-2 times
    set LangFlashOverDesc3=Thank you for using our tool
    set LangFlashOverDesc4=A tool by
    set LangFlashOverDesc5=Based on wzsx150's script
    set LangExit=Press any key to exit
)
if %LangChoice%==2 (
    COLOR CF

    set language=vietnamese

    set LangPreTitle=Preparing:

    set LangGetSList=Getting sources list...

    set LangGetSListFailed=Download sources list failed！

    set LangPauseRetry=Press any key to retry...

    set LangChoiceRecVer=Please select a version you wanna flash:

    set LangYouSelected=You selected

    set LangDownExist=already exist.

    set LangDownSelected=Downloading selected recovery from

    set LangGetRECFailed=Download selected recovery failed！

    set LangDownADB=Downloading Android SDK Platform-Tools...

    set LangExpADB=Expanding Android SDK Platform-Tools...

    Set LangExistADB=Android SDK Platform-Tools already exist.

    set LangTitle=One click flash

    set LangRecInfo=THÔNG TIN RECOVERY

    set LangRecName=Tên Recovery

    set LangRecver=Phiên bản Recovery

    set LangDevName=Tên thiết bị

    set LangRecAuth=Tác giả

    set LangRecDate=Ngày xuất bản

    set LangSuppMode=Hỗ trợ flash ở chế độ thường và fastboot

    set LangPause=Nhấn phím bất kỳ để tiếp tục

    set LangMenuMode=Chế độ hiện tại trên điện thoại của bạn là

    set LangMenuNormalMode=Chế độ thường

    set LangMenuFastMode=Chế độ fastboot

    set LangMenuOtherMode=Chế độ khác

    set LangMenuNumChoice=Nhập đúng số bạn chọn rồi nhấn ENTER

    set LangOtherReboot=Hãy khởi động điện thoại của bạn về 1 trong 2 chế độ dưới

    set LangOtherPause=Nhấn phím bất kỳ để quay trở về menu chính. Tool sẽ tự động quay về trong vòng 6 giây nếu không nhấn bất kỳ phím nào.

    set LangOr=hoặc

    set LangDevTypeTitle=Hãy kết nối điện thoại của bạn với máy tính

    set LangDevTypeMakeSure=Đảm bảo rằng

    set LangDevTypeMakeSure1=Điện thoại của bạn đã mở khoá bootloader

    set LangDevTypeMakeSure2=Điện thoại đang mở sáng

    set LangDevTypeMakeSure3=Đã bật USB Debugging

    set LangDevTypeMakeSure4=Đã cài đặt đủ driver

    set LangDevTypeMakeSure5=When the phone prompts USB debugging

    set LangDevTypeMakeSure5a=authorization, check Always and click Authorize

    set LangDevTypeMakeSure6=Điện thoại đang ở chế độ fastboot

    set LangDevTypeCheckTitle=Đang kiểm tra thiết bị được kết nối

    set LangDevTypeCheckDesc1=Nếu bạn đang ở bước này quá lâu, hãy kiểm tra các thông tin trên
    
    set LangDevTypeCheckDesc2=và khởi động lại thiết bị của bạn

    set LangDevTypeRestarting=Điện thoại đang khởi động lại

    set LangFlashingDesc=Nếu bạn đang ở bước này quá lâu, hãy kiểm tra lại rằng

    set LangFlashingDesc1=Đã kết nối cáp USB

    set LangFlashingDesc2=Cài đặt đúng driver cần thiết

    set LangFlashingDesc3=Điện thoại ĐANG ở chế độ fastboot

    set LangFlashingRec=Đang flash recovery

    set LangFlashingRecDesc1=Nếu hiện OKAY là flash thành công, ngược lại là thất bại

    set LangFlashingRecDesc2=Nếu bạn đang ở bước này quá lâu, hãy khởi động lại tool

    set LangFlashFailed=SOMETHING WENT WRONG！

    set LangFlashFailedTitle=Flash thất bại

    set LangFlashFailedDesc1=Hãy kiểm tra model khớp đúng với thiết bị

    set LangFlashFailedDesc2=Đảm bảo fastboot thực hiện đúng với thiết bị

    set LangFlashFailedDesc3=Chạy lại tool

    set LangFlashFailedDesc4=Nếu bạn vẫn không thành công, hãy liên hệ với tác giả

    set LangFlashFailedDesc5=Cảm ơn bạn đả sử dụng tool của chúng tôi

    set LangFlashOverTitle=Flash recovery thành công

    set LangFlashOverDesc1=Điện thoại sẽ khởi động về

    set LangFlashOverDesc2=Điện thoại của bạn sẽ có thể khởi động 1-2 lần

    set LangFlashOverDesc3=Cảm ơn bạn đả sử dụng tool của chúng tôi

    set LangFlashOverDesc4=Tool được viết bởi

    set LangFlashOverDesc5=Dựa trên script của wzsx150

    set LangExit=Nhấn phím bất kỳ để thoát
)
if %LangChoice%==3 (
    COLOR 6F

    set language=chinese

    set LangPreTitle=准备环境：

    set LangGetSList=正在获取源数据列表...

    set LangGetSListFailed=获取源数据列表失败！

    set LangPauseRetry=按任意键重试...

    set LangChoiceRecVer=请选择欲刷入的版本:

    set LangYouSelected=您已选择

    set LangDownExist=已经存在。

    set LangDownSelected=正在下载已选的 Recovery，地址：

    set LangGetRECFailed=下载已选的 Recovery 失败！

    set LangDownADB=正在下载 Android SDK 平台工具...

    set LangExpADB=正在解压 Android SDK 平台工具...

    Set LangExistADB=Android SDK 平台工具已经存在。

    set LangTitle=一键刷入

    set LangRecInfo=Recovery 信息

    set LangRecName=名称

    set LangRecver=版本

    set LangDevName=设备名称

    set LangRecAuth=作者
    
    set LangRecDate=发布日期

    set LangSuppMode=支持设备处于开机或 Fastboot 状态

    set LangPause=按任意键继续

    set LangMenuMode=您的设备当前状态是

    set LangMenuNormalMode=正常开机模式

    set LangMenuFastMode=Fastboot 模式

    set LangMenuOtherMode=其他模式

    set LangMenuNumChoice=请选择当前手机运行状态

    set LangOtherReboot=请重启您的设备至

    set LangOtherPause=按任意键返回主菜单。若 6 秒内无操作将自动返回。

    set LangOr=或

    set LangDevTypeTitle=请连接您的设备至您的计算机

    set LangDevTypeMakeSure=并确保

    set LangDevTypeMakeSure1=设备已经解锁 Bootloader 锁

    set LangDevTypeMakeSure2=设备已经解锁屏幕

    set LangDevTypeMakeSure3=USB 调试已启用

    set LangDevTypeMakeSure4=设备驱动已经安装至计算机内

    set LangDevTypeMakeSure5=当设备提示申请 USB 调试授权时，

    set LangDevTypeMakeSure5a=勾选“一律允许使用该计算机”并点击允许

    set LangDevTypeMakeSure6=设备当前状态为 Fastboot 模式

    set LangDevTypeCheckTitle=正在检查设备连接状态

    set LangDevTypeCheckDesc1=如果在此步骤上停留时间过长，请检查上述信息。
    
    set LangDevTypeCheckDesc2=并重启您的设备

    set LangDevTypeRestarting=设备正在重启中

    set LangFlashingDesc=如果在此步骤上停留时间过长，请检查

    set LangFlashingDesc1=USB 线已经连接

    set LangFlashingDesc2=设备驱动已经正确安装

    set LangFlashingRec=正在刷入 Recovery

    set LangFlashingRecDesc1=若提示 [OKAY] 则刷入成功，否则为失败。

    set LangFlashingRecDesc2=如果在此步骤上停留时间过长，请重启本工具

    set LangFlashFailed=出了点问题!

    set LangFlashFailedTitle=刷入失败

    set LangFlashFailedDesc1=请检查设备型号是否正确

    set LangFlashFailedDesc2=确保设备状态在 Fastboot 模式，并且 Bootloader 已解锁

    set LangFlashFailedDesc3=重新启动本脚本

    set LangFlashFailedDesc4=若仍失败，请联系作者

    set LangFlashFailedDesc5=感谢您使用本工具

    set LangFlashOverTitle=刷入 Recovery 成功

    set LangFlashOverDesc1=设备将会重启至

    set LangFlashOverDesc2=设备可能会重启 1-2 次

    set LangFlashOverDesc3=感谢您使用本工具

    set LangFlashOverDesc4=本工具作者为

    set LangFlashOverDesc5=基于 wzsx150 的脚本制作

    set LangExit=按任意键退出
)
:** Language Config End, DON'T DELETE EMPTY LINE **

:DownloadSList
CLS
title %LangPreTitle% %LangGetSList%
echo %LangGetSList%
if exist sources.list (
    del sources.list
)
if %WindowsVer% LSS 10 (
    certutil -urlcache -split -f "%SourcesListURL%" "sources.list"
) else (
    powershell Invoke-WebRequest "%SourcesListURL%" -OutFile "sources.list"
)


if not exist sources.list (
    echo,
    ECHO.***********************************************
    echo %LangGetSListFailed%
    echo %LangPauseRetry%
    pause>nul
    goto DownloadSList
)
echo,
title %LangPreTitle% %LangChoiceRecVer%
ECHO.***********************************************

set devnamecount=0
set "devname_choice_options="
for /F "delims=# tokens=1" %%A in (sources.list) do (
    if !devnamecount!==9 (
        goto SListdevnameOut
    )
    set /a devnamecount+=1
    set "devnameoptions[!devnamecount!]=%%A"
    set devname_choice_options=!devname_choice_options!!devnamecount!
)
:SListdevnameOut
set namecount=0
set "name_choice_options="
for /F "delims=# tokens=2" %%A in (sources.list) do (
    if !namecount!==9 (
        goto SListNameOut
    )
    set /a namecount+=1
    set "nameoptions[!namecount!]=%%A"
    set name_choice_options=!name_choice_options!!namecount!
)
:SListNameOut
set vercount=0
set "ver_choice_options="
for /F "delims=# tokens=3" %%A in (sources.list) do (
    if !vercount!==9 (
        goto SListVerOut
    )
    set /a vercount+=1
    set "veroptions[!vercount!]=%%A"
    set ver_choice_options=!ver_choice_options!!vercount!
)
:SListVerOut
set authcount=0
set "auth_choice_options="
for /F "delims=# tokens=4" %%A in (sources.list) do (
    if !authcount!==9 (
        goto SListauthOut
    )
    set /a authcount+=1
    set "authoptions[!authcount!]=%%A"
    set auth_choice_options=!auth_choice_options!!authcount!
)
:SListauthOut
set datecount=0
set "date_choice_options="
for /F "delims=# tokens=5" %%A in (sources.list) do (
    if !datecount!==9 (
        goto SListdateOut
    )
    set /a datecount+=1
    set "dateoptions[!datecount!]=%%A"
    set date_choice_options=!date_choice_options!!datecount!
)
:SListdateOut
set linkcount=0
set "link_choice_options="
for /F "delims=# tokens=6" %%A in (sources.list) do (
    if !linkcount!==9 (
        goto SListLinkOut
    )
    set /a linkcount+=1
    set "linkoptions[!linkcount!]=%%A"
    set link_choice_options=!link_choice_options!!linkcount!
)
:SListLinkOut
for /L %%A in (1,1,!vercount!) do echo [%%A]: %LangDevName%:!devnameoptions[%%A]!, %LangRecName%:!nameoptions[%%A]!, %LangRecver%:!veroptions[%%A]!, %LangRecAuth%:!authoptions[%%A]! ,%LangRecDate%:!dateoptions[%%A]!.
choice /c:!ver_choice_options! /n /m "%LangChoiceRecVer%"
set RecVerChoice=%errorlevel%
echo,
ECHO.***********************************************
echo %LangYouSelected% %LangDevName%:!devnameoptions[%RecVerChoice%]!, %LangRecName%:!nameoptions[%RecVerChoice%]!, %LangRecver%:!veroptions[%RecVerChoice%]!, %LangRecAuth%:!authoptions[%RecVerChoice%]! ,%LangRecDate%:!dateoptions[%RecVerChoice%]!.

if not exist recoverys (
    mkdir recoverys
)
if exist "recoverys\!devnameoptions[%RecVerChoice%]!_!nameoptions[%RecVerChoice%]!_!veroptions[%RecVerChoice%]!_!dateoptions[%RecVerChoice%]!_!authoptions[%RecVerChoice%]!_recovery.img" (
    echo recoverys\!devnameoptions[%RecVerChoice%]!_!nameoptions[%RecVerChoice%]!_!veroptions[%RecVerChoice%]!_!dateoptions[%RecVerChoice%]!_!authoptions[%RecVerChoice%]!_recovery.img %LangDownExist%
) else (
    title %LangPreTitle% %LangDownSelected% !linkoptions[%RecVerChoice%]!...
    echo %LangDownSelected% !linkoptions[%RecVerChoice%]!...
    if %WindowsVer% LSS 10 (
        certutil -urlcache -split -f "!linkoptions[%RecVerChoice%]!" "recoverys\!devnameoptions[%RecVerChoice%]!_!nameoptions[%RecVerChoice%]!_!veroptions[%RecVerChoice%]!_!dateoptions[%RecVerChoice%]!_!authoptions[%RecVerChoice%]!_recovery.img"
    ) else (
        powershell Invoke-WebRequest "!linkoptions[%RecVerChoice%]!" -OutFile "recoverys\!devnameoptions[%RecVerChoice%]!_!nameoptions[%RecVerChoice%]!_!veroptions[%RecVerChoice%]!_!dateoptions[%RecVerChoice%]!_!authoptions[%RecVerChoice%]!_recovery.img"
    )
)

if not exist recoverys\!devnameoptions[%RecVerChoice%]!_!nameoptions[%RecVerChoice%]!_!veroptions[%RecVerChoice%]!_!dateoptions[%RecVerChoice%]!_!authoptions[%RecVerChoice%]!_recovery.img (
    echo,
    ECHO.***********************************************
    echo %LangGetRECFailed%
    echo %LangPauseRetry%
    pause>nul
    goto DownloadSList
)

echo,
ECHO.***********************************************
if not exist platform-tools (
    title %LangPreTitle% %LangDownADB%
    ECHO %LangDownADB%
    if %WindowsVer% LSS 10 (
        certutil -urlcache -split -f "%ADBToolsURL%" "platform-tools-latest-windows.zip" 
    ) else (
        powershell Invoke-WebRequest "%ADBToolsURL%" -OutFile "platform-tools-latest-windows.zip" 
    )
    title %LangPreTitle% %LangExpADB%
    ECHO %LangExpADB%
    powershell Expand-Archive -Path platform-tools-latest-windows.zip -DestinationPath %~dp0
    del platform-tools-latest-windows.zip
) else (
    echo %LangExistADB%
)

set device_name=!devnameoptions[%RecVerChoice%]!
set rec_name=!nameoptions[%RecVerChoice%]!
set rec_ver=!veroptions[%RecVerChoice%]!
set rec_auth=!authoptions[%RecVerChoice%]!
set rec_tooleditor=DumbHokage, SummonHIM
set rec_date=!dateoptions[%RecVerChoice%]!
set rec_img=!devnameoptions[%RecVerChoice%]!_!nameoptions[%RecVerChoice%]!_!veroptions[%RecVerChoice%]!_!dateoptions[%RecVerChoice%]!_!authoptions[%RecVerChoice%]!_recovery.img

TITLE %device_name% %LangTitle% %rec_name%

cd /d "%~dp0"

:LOGO
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.              %LangRecInfo%
ECHO.
ECHO.              %LangRecName%: %rec_name%
ECHO.              %LangRecver%: %rec_ver%
ECHO.              %LangDevName%: %device_name%
ECHO.              %LangRecAuth%: %rec_auth%
ECHO.              %LangRecDate%: %rec_date%
ECHO.           
ECHO.     %LangSuppMode%
ECHO.***********************************************
ECHO.
ECHO.%LangPause%...
pause>nul

:MENU
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.             %LangMenuMode%:
ECHO.
ECHO.              1.%LangMenuNormalMode%
ECHO.
ECHO.              2.%LangMenuFastMode%
ECHO.
ECHO.              3.%LangMenuOtherMode%
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
choice /c 123 /m "%LangMenuNumChoice%:"
set MenuNumChoice=%errorlevel%
if "%MenuNumChoice%"=="1" (
    goto IN_SYSTEM
)
if "%MenuNumChoice%"=="2" (
    goto FASTBOOT_MODE
)
if "%MenuNumChoice%"=="3" (
    goto OTHERS
)

:OTHERS
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.             %LangOtherReboot%
ECHO.
ECHO.              %LangMenuNormalMode%
ECHO.                   %LangOr%
ECHO.              %LangMenuFastMode%
ECHO.
ECHO.%LangOtherPause%
ECHO.***********************************************
ECHO.
timeout /t 6 >nul
echo.
goto MENU


:IN_SYSTEM
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.        %LangDevTypeTitle%
ECHO.
ECHO.            %LangDevTypeMakeSure%:
ECHO.      1. %LangDevTypeMakeSure1%
ECHO.      2. %LangDevTypeMakeSure2%
ECHO.      3. %LangDevTypeMakeSure3%
ECHO.      4. %LangDevTypeMakeSure4%
ECHO.      5. %LangDevTypeMakeSure5%
ECHO.         %LangDevTypeMakeSure5a%
ECHO.
ECHO.            %LangPause%...
ECHO.***********************************************
ECHO.
pause>nul
ECHO.        %LangDevTypeCheckTitle%...
ECHO.
ECHO.   %LangDevTypeCheckDesc1%
ECHO.           %LangDevTypeCheckDesc2%
ECHO.***********************************************
ECHO.
timeout /t 2 /nobreak >NUL
platform-tools\adb.exe wait-for-device >NUL 2>NUL

CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             %LangDevTypeRestarting%
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.   %LangDevTypeCheckDesc1%
ECHO.
platform-tools\adb.exe reboot bootloader >NUL 2>NUL
timeout /t 3 /nobreak >NUL
goto FLASHING


:FASTBOOT_MODE
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.          %LangDevTypeTitle%
ECHO.
ECHO.           %LangDevTypeMakeSure%:
ECHO.      1. %LangDevTypeMakeSure1%
ECHO.      2. %LangDevTypeMakeSure6%
ECHO.      3. %LangDevTypeMakeSure4%
ECHO.
ECHO.            %LangPause%...
ECHO.***********************************************
ECHO.
pause>nul
goto FLASHING


:FLASHING
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.
ECHO.          %LangDevTypeCheckTitle%...
ECHO.
ECHO.
ECHO.      %LangFlashingDesc%
ECHO.
ECHO.      1. %LangFlashingDesc1%
ECHO.      2. %LangFlashingDesc2%
ECHO.      3. %LangDevTypeMakeSure6%
ECHO.
ECHO.             %LangDevTypeCheckDesc2%
ECHO.***********************************************
timeout /t 2 /nobreak >NUL
platform-tools\fastboot.exe wait-for-device >NUL 2>NUL

CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             %LangFlashingRec%...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.      %LangFlashingRecDesc1%
ECHO.
ECHO.    %LangFlashingRecDesc2%
ECHO.
platform-tools\fastboot.exe flash recovery "recoverys\%rec_img%" || goto FLASH_FAILED
REM platform-tools\fastboot.exe flash misc misc.bin >NUL 2>NUL
timeout /t 6 /nobreak >NUL
goto FLASH_OVER


:FLASH_FAILED
ECHO.
ECHO. %LangFlashFailed%
timeout /t 6 /nobreak >NUL
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.
ECHO.                   %LangFlashFailedTitle%
ECHO.
ECHO.           1. %LangFlashFailedDesc1%
ECHO.           2. %LangFlashFailedDesc2%
ECHO.           3. %LangFlashFailedDesc3%
ECHO.              %LangFlashFailedDesc4%
ECHO.
ECHO.           %rec_auth% %LangFlashFailedDesc5%
ECHO.
ECHO.            %LangExit%...
ECHO.***********************************************
ECHO.
timeout /t 1 /nobreak >NUL
pause >NUL
EXIT


:FLASH_OVER
CLS
ECHO.
ECHO.         %device_name% %LangTitle% %rec_name%
ECHO.***********************************************
ECHO.
ECHO.             %LangFlashOverTitle%
ECHO.
ECHO.
ECHO.        %LangFlashOverDesc1% %rec_name%
ECHO.            %LangFlashOverDesc2%
ECHO.
ECHO.
ECHO.           %LangFlashOverDesc3%
ECHO.           %LangFlashOverDesc4% %rec_tooleditor%
ECHO.        %LangFlashOverDesc5%
ECHO.
ECHO.           %LangExit%...
ECHO.***********************************************
ECHO.
platform-tools\fastboot.exe reboot recovery
pause >NUL

EXIT