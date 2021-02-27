
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


set SourcesListURL=[Edit source list url here]
set ADBToolsURL=https://dl.google.com/android/repository/platform-tools-latest-windows.zip


for /f "tokens=3 delims=n*." %%p in ('ver^') do (
    set WindowsVer=%%p
)
if %WindowsVer% LSS 10 (
    set LangChoice=1
    goto QuickLangSetting
)
CLS
echo.***********************************************
echo.           Please select a language:
ECHO,
echo.               1.English
echo.               2.Vietnamese (Tiếng Việt)
echo.               3.Simplified Chinese (简体中文)
echo.               4.Traditional Chinese (繁體中文)
ECHO,
echo.***********************************************
CHOICE /C 1234
set LangChoice=%errorlevel%
:QuickLangSetting
:** Language Config Start, DON'T DELETE EMPTY LINE **
if %LangChoice%==1 (
    COLOR 1F
    set language=english
    set LangPreTitle=Preparing:
    set LangGetSList=Getting sources list...
    set LangGetSListFailed=Download sources list failed！
    set LangWannaGetOfflineList=Do you wanna browse the downloaded file
    set LangPauseRetry=Press any key to retry...
    set LangChoiceRecVer=Please select a version you wanna flash:
    set LangYouSelected=You selected
    set LangDownExist=already exist.
    set LangDownSelected=Downloading selected recovery from
    set LangGetRECFailed=Download selected recovery failed！
    set LangEnterFile=Enter a file to load
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

    set LangEnterFile=Enter a file to load

    set LangWannaGetOfflineList=Do you wanna browse the downloaded file

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

    set language=schinese

    set LangPreTitle=准备环境：

    set LangGetSList=正在获取源数据列表...

    set LangGetSListFailed=获取源数据列表失败！

    set LangWannaGetOfflineList=要浏览已下载的文件吗

    set LangPauseRetry=按任意键重试...

    set LangChoiceRecVer=请选择欲刷入的版本:

    set LangYouSelected=您已选择

    set LangDownExist=已经存在。

    set LangDownSelected=正在下载已选的 Recovery，地址：

    set LangGetRECFailed=下载已选的 Recovery 失败！

    set LangEnterFile=请选择文件

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

    set LangFlashOverDesc2=并可能会重启 1-2 次

    set LangFlashOverDesc3=感谢您使用本工具

    set LangFlashOverDesc4=本工具作者为

    set LangFlashOverDesc5=基于 wzsx150 的脚本制作

    set LangExit=按任意键退出
)
if %LangChoice%==4 (
    COLOR 6F

    set language=tchinese

    set LangPreTitle=準備環境：

    set LangGetSList=正在獲取源數據列表...

    set LangGetSListFailed=獲取源數據列表失敗！

    set LangWannaGetOfflineList=要瀏覽已下載的文件嗎

    set LangPauseRetry=按任意鍵重試...

    set LangChoiceRecVer=請選擇欲刷入的版本:

    set LangYouSelected=您已選擇

    set LangDownExist=已經存在。

    set LangDownSelected=正在下載已選的 Recovery，地址：

    set LangGetRECFailed=下載已選的 Recovery 失敗！

    set LangEnterFile=請選擇文件

    set LangDownADB=正在下載 Android SDK 平台工具...

    set LangExpADB=正在解壓 Android SDK 平台工具...

    Set LangExistADB=Android SDK 平台工具已經存在。

    set LangTitle=一鍵刷寫

    set LangRecInfo=Recovery 信息

    set LangRecName=名稱

    set LangRecver=版本

    set LangDevName=設備名稱

    set LangRecAuth=作者
    
    set LangRecDate=發布日期

    set LangSuppMode=支持設備處於開機或 Fastboot 狀態

    set LangPause=按任意鍵繼續

    set LangMenuMode=您的設備當前狀態是

    set LangMenuNormalMode=正常開機模式

    set LangMenuFastMode=Fastboot 模式

    set LangMenuOtherMode=其他模式

    set LangMenuNumChoice=請選擇當前手機運行狀態

    set LangOtherReboot=請重啟您的設備至

    set LangOtherPause=按任意鍵返回主菜單。若 6 秒內無操作將自動返回。

    set LangOr=或

    set LangDevTypeTitle=請連接您的設備至您的計算機

    set LangDevTypeMakeSure=並確保

    set LangDevTypeMakeSure1=設備已經解鎖 Bootloader 鎖

    set LangDevTypeMakeSure2=設備已經解鎖屏幕

    set LangDevTypeMakeSure3=USB 偵錯已啟用

    set LangDevTypeMakeSure4=設備驅動已經安裝至計算機內

    set LangDevTypeMakeSure5=當設備提示申請 USB 偵錯授權時，

    set LangDevTypeMakeSure5a=勾選“一律允許透過這台電腦進行”並點擊允許

    set LangDevTypeMakeSure6=設備當前狀態為 Fastboot 模式

    set LangDevTypeCheckTitle=正在檢查設備連接狀態

    set LangDevTypeCheckDesc1=如果在此步驟上停留時間過長，請檢查上述信息。
    
    set LangDevTypeCheckDesc2=並重啟您的設備

    set LangDevTypeRestarting=設備正在重啟中

    set LangFlashingDesc=如果在此步驟上停留時間過長，請檢查

    set LangFlashingDesc1=USB 線已經連接

    set LangFlashingDesc2=設備驅動已經正確安裝

    set LangFlashingRec=正在刷寫 Recovery

    set LangFlashingRecDesc1=若提示 [OKAY] 則刷寫成功，否則為失敗。

    set LangFlashingRecDesc2=如果在此步驟上停留時間過長，請重啟本工具

    set LangFlashFailed=出了點問題！

    set LangFlashFailedTitle=刷寫失敗

    set LangFlashFailedDesc1=請檢查設備型號是否正確

    set LangFlashFailedDesc2=確保設備狀態在 Fastboot 模式，並且 Bootloader 已解鎖

    set LangFlashFailedDesc3=重新啟動本腳本

    set LangFlashFailedDesc4=若仍失敗，請聯繫作者

    set LangFlashFailedDesc5=感謝您使用本工具

    set LangFlashOverTitle=刷寫 Recovery 成功

    set LangFlashOverDesc1=設備將會重啟至

    set LangFlashOverDesc2=並可能會重啟 1-2 次

    set LangFlashOverDesc3=感謝您使用本工具

    set LangFlashOverDesc4=本工具作者為

    set LangFlashOverDesc5=基於 wzsx150 的腳本製作

    set LangExit=按任意鍵退出
)
:** Language Config End, DON'T DELETE EMPTY LINE **


:DownloadSList
cls
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
    if exist recoverys (
        goto OfflineChoice
    ) else (
        echo,
        echo.***********************************************
        echo %LangGetSListFailed%
        echo %LangPauseRetry%
        pause>nul
        goto DownloadSList
    )
)
goto SListChoice
:OfflineChoice
echo,
echo.***********************************************
echo %LangGetSListFailed%
choice /m "%LangWannaGetOfflineList%"
set OfflineChoice=%errorlevel%
if %OfflineChoice%==1 (
    goto OfflineList
)
if %OfflineChoice%==2 (
    goto DownloadSList
)

:SListChoice
echo,
title %LangPreTitle% %LangChoiceRecVer%
echo.***********************************************
set DevNameCount=0
set "DevNameChoiceOptions="
for /F "delims=# tokens=1" %%A in (sources.list) do (
    if !DevNameCount!==9 (
        goto SListdevnameOut
    )
    set /a DevNameCount+=1
    set "DevNameOptions[!DevNameCount!]=%%A"
    set DevNameChoiceOptions=!DevNameChoiceOptions!!DevNameCount!
)
:SListdevnameOut
set NameCount=0
set "NameChoiceOptions="
for /F "delims=# tokens=2" %%A in (sources.list) do (
    if !NameCount!==9 (
        goto SListNameOut
    )
    set /a NameCount+=1
    set "NameOptions[!NameCount!]=%%A"
    set NameChoiceOptions=!NameChoiceOptions!!NameCount!
)
:SListNameOut
set VerCount=0
set "VerChoiceOptions="
for /F "delims=# tokens=3" %%A in (sources.list) do (
    if !VerCount!==9 (
        goto SListVerOut
    )
    set /a VerCount+=1
    set "VerOptions[!VerCount!]=%%A"
    set VerChoiceOptions=!VerChoiceOptions!!VerCount!
)
:SListVerOut
set AuthCount=0
set "AuthChoiceOptions="
for /F "delims=# tokens=4" %%A in (sources.list) do (
    if !AuthCount!==9 (
        goto SListauthOut
    )
    set /a AuthCount+=1
    set "AuthOptions[!AuthCount!]=%%A"
    set AuthChoiceOptions=!AuthChoiceOptions!!AuthCount!
)
:SListauthOut
set DateCount=0
set "DateChoiceOptions="
for /F "delims=# tokens=5" %%A in (sources.list) do (
    if !DateCount!==9 (
        goto SListdateOut
    )
    set /a DateCount+=1
    set "DateOptions[!DateCount!]=%%A"
    set DateChoiceOptions=!DateChoiceOptions!!DateCount!
)
:SListdateOut
set LinkCount=0
set "LinkChoiceOptions="
for /F "delims=# tokens=6" %%A in (sources.list) do (
    if !LinkCount!==9 (
        goto SListLinkOut
    )
    set /a LinkCount+=1
    set "LinkOptions[!LinkCount!]=%%A"
    set LinkChoiceOptions=!LinkChoiceOptions!!LinkCount!
)
:SListLinkOut
for /L %%A in (1,1,!VerCount!) do echo [%%A]: %LangDevName%:!DevNameOptions[%%A]!, %LangRecName%:!NameOptions[%%A]!, %LangRecver%:!VerOptions[%%A]!, %LangRecAuth%:!AuthOptions[%%A]! ,%LangRecDate%:!DateOptions[%%A]!.
echo.***********************************************
choice /c:!VerChoiceOptions! /n /m "%LangChoiceRecVer%"
set RecVerChoice=%errorlevel%
echo,
echo.***********************************************
echo %LangYouSelected% %LangDevName%:!DevNameOptions[%RecVerChoice%]!, %LangRecName%:!NameOptions[%RecVerChoice%]!, %LangRecver%:!VerOptions[%RecVerChoice%]!, %LangRecAuth%:!AuthOptions[%RecVerChoice%]! ,%LangRecDate%:!DateOptions[%RecVerChoice%]!.
if not exist recoverys (
    mkdir recoverys
)
if exist "recoverys\!DevNameOptions[%RecVerChoice%]!_!NameOptions[%RecVerChoice%]!_!VerOptions[%RecVerChoice%]!_!DateOptions[%RecVerChoice%]!_!AuthOptions[%RecVerChoice%]!_recovery.img" (
    echo recoverys\!DevNameOptions[%RecVerChoice%]!_!NameOptions[%RecVerChoice%]!_!VerOptions[%RecVerChoice%]!_!DateOptions[%RecVerChoice%]!_!AuthOptions[%RecVerChoice%]!_recovery.img %LangDownExist%
) else (
    title %LangPreTitle% %LangDownSelected% !LinkOptions[%RecVerChoice%]!...
    echo %LangDownSelected% !LinkOptions[%RecVerChoice%]!...
    if %WindowsVer% LSS 10 (
        certutil -urlcache -split -f "!LinkOptions[%RecVerChoice%]!" "recoverys\!DevNameOptions[%RecVerChoice%]!_!NameOptions[%RecVerChoice%]!_!VerOptions[%RecVerChoice%]!_!DateOptions[%RecVerChoice%]!_!AuthOptions[%RecVerChoice%]!_recovery.img"
    ) else (
        powershell Invoke-WebRequest "!LinkOptions[%RecVerChoice%]!" -OutFile "recoverys\!DevNameOptions[%RecVerChoice%]!_!NameOptions[%RecVerChoice%]!_!VerOptions[%RecVerChoice%]!_!DateOptions[%RecVerChoice%]!_!AuthOptions[%RecVerChoice%]!_recovery.img"
    )
)
if not exist recoverys\!DevNameOptions[%RecVerChoice%]!_!NameOptions[%RecVerChoice%]!_!VerOptions[%RecVerChoice%]!_!DateOptions[%RecVerChoice%]!_!AuthOptions[%RecVerChoice%]!_recovery.img (
    echo,
    echo.***********************************************
    echo %LangGetRECFailed%
    echo %LangPauseRetry%
    pause>nul
    goto DownloadSList
)
goto GetAdb

:OfflineList
set OfflineType=1
set offlinecount=0
for /F "delims=" %%A in ('dir /a:-d /b recoverys') do (
    if !offlinecount!==9 (
        goto OfflineOut
    )
    set /a offlinecount+=1
    set "offlineoptions[!offlinecount!]=%%A"
    set choice_offline_options=!choice_offline_options!!offlinecount!
)
:OfflineOut
echo,
echo.***********************************************
for /L %%A in (1,1,!offlinecount!) do echo [%%A]. !offlineoptions[%%A]!
choice /c:!choice_offline_options! /n /m "%LangEnterFile%: "
set RecOfflineChoice=!offlineoptions[%errorlevel%]!

:GetAdb
echo,
echo.***********************************************
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

set DevName=!DevNameOptions[%RecVerChoice%]!
set RecName=!NameOptions[%RecVerChoice%]!
set RecVer=!VerOptions[%RecVerChoice%]!
set RecAuth=!AuthOptions[%RecVerChoice%]!
set RecDate=!DateOptions[%RecVerChoice%]!
set RecToolEditor=DumbHokage, SummonHIM
if "%OfflineType%"=="1" (
    goto OfflineRecImg
) else (
    goto NormalRecImg
)
:OfflineRecImg
set rec_img=%RecOfflineChoice%
goto MainTitle
:NormalRecImg
set rec_img=!DevNameOptions[%RecVerChoice%]!_!NameOptions[%RecVerChoice%]!_!VerOptions[%RecVerChoice%]!_!DateOptions[%RecVerChoice%]!_!AuthOptions[%RecVerChoice%]!_recovery.img

:MainTitle
cd /d "%~dp0"
if "%OfflineType%"=="1" (
    TITLE %LangTitle% %RecOfflineChoice%
) else (
    TITLE %DevName% %LangTitle% %RecName%
)

:LOGO
CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
    echo.***********************************************
    echo.              %LangRecInfo%
    echo.
    echo. %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
    echo.***********************************************
    echo.              %LangRecInfo%
    echo.
    echo.              %LangRecName%: %RecName%
    echo.              %LangRecver%: %RecVer%
    echo.              %LangDevName%: %DevName%
    echo.              %LangRecAuth%: %RecAuth%
    echo.              %LangRecDate%: %RecDate%    
)
echo.           
echo.     %LangSuppMode%
echo.***********************************************
echo.
echo.%LangPause%...
pause>nul

:MENU
CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.             %LangMenuMode%:
echo.
echo.              1.%LangMenuNormalMode%
echo.
echo.              2.%LangMenuFastMode%
echo.
echo.              3.%LangMenuOtherMode%
echo.
echo.
echo.***********************************************
echo.
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
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.             %LangOtherReboot%
echo.
echo.              %LangMenuNormalMode%
echo.                   %LangOr%
echo.              %LangMenuFastMode%
echo.
echo.%LangOtherPause%
echo.***********************************************
echo.
timeout /t 6 >nul
echo.
goto MENU


:IN_SYSTEM
CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.        %LangDevTypeTitle%
echo.
echo.            %LangDevTypeMakeSure%:
echo.      1. %LangDevTypeMakeSure1%
echo.      2. %LangDevTypeMakeSure2%
echo.      3. %LangDevTypeMakeSure3%
echo.      4. %LangDevTypeMakeSure4%
echo.      5. %LangDevTypeMakeSure5%
echo.         %LangDevTypeMakeSure5a%
echo.
echo.            %LangPause%...
echo.***********************************************
echo.
pause>nul
echo.        %LangDevTypeCheckTitle%...
echo.
echo.   %LangDevTypeCheckDesc1%
echo.           %LangDevTypeCheckDesc2%
echo.***********************************************
echo.
timeout /t 2 /nobreak >NUL
platform-tools\adb.exe wait-for-device >NUL 2>NUL

CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.
echo.
echo.             %LangDevTypeRestarting%
echo.
echo.
echo.***********************************************
echo.
echo.   %LangDevTypeCheckDesc1%
echo.
platform-tools\adb.exe reboot bootloader >NUL 2>NUL
timeout /t 3 /nobreak >NUL
goto FLASHING


:FASTBOOT_MODE
CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.          %LangDevTypeTitle%
echo.
echo.           %LangDevTypeMakeSure%:
echo.      1. %LangDevTypeMakeSure1%
echo.      2. %LangDevTypeMakeSure6%
echo.      3. %LangDevTypeMakeSure4%
echo.
echo.            %LangPause%...
echo.***********************************************
echo.
pause>nul
goto FLASHING


:FLASHING
CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.
echo.          %LangDevTypeCheckTitle%...
echo.
echo.
echo.      %LangFlashingDesc%
echo.
echo.      1. %LangFlashingDesc1%
echo.      2. %LangFlashingDesc2%
echo.      3. %LangDevTypeMakeSure6%
echo.
echo.             %LangDevTypeCheckDesc2%
echo.***********************************************
timeout /t 2 /nobreak >NUL
platform-tools\fastboot.exe wait-for-device >NUL 2>NUL

CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.
echo.
echo.             %LangFlashingRec%...
echo.
echo.
echo.***********************************************
echo.
echo.      %LangFlashingRecDesc1%
echo.
echo.    %LangFlashingRecDesc2%
echo.
platform-tools\fastboot.exe flash recovery "recoverys\%rec_img%" || goto FLASH_FAILED
REM platform-tools\fastboot.exe flash misc misc.bin >NUL 2>NUL
timeout /t 6 /nobreak >NUL
goto FLASH_OVER


:FLASH_FAILED
echo.
echo. %LangFlashFailed%
timeout /t 6 /nobreak >NUL
CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.
echo.                   %LangFlashFailedTitle%
echo.
echo.           1. %LangFlashFailedDesc1%
echo.           2. %LangFlashFailedDesc2%
echo.           3. %LangFlashFailedDesc3%
echo.              %LangFlashFailedDesc4%
echo.
echo.           %RecAuth% %LangFlashFailedDesc5%
echo.
echo.            %LangExit%...
echo.***********************************************
echo.
timeout /t 1 /nobreak >NUL
pause >NUL
EXIT


:FLASH_OVER
CLS
echo.
if "%OfflineType%"=="1" (
    echo.  %LangTitle% %RecOfflineChoice%
) else (
    echo.         %DevName% %LangTitle% %RecName%
)
echo.***********************************************
echo.
echo.             %LangFlashOverTitle%
echo.
echo.
echo.        %LangFlashOverDesc1% %RecName%
echo.        %LangFlashOverDesc2%
echo.
echo.
echo.        %LangFlashOverDesc3%
echo.        %LangFlashOverDesc4% %RecToolEditor%
echo.        %LangFlashOverDesc5%
echo.
echo.           %LangExit%...
echo.***********************************************
echo.
platform-tools\fastboot.exe reboot recovery
pause >NUL

EXIT