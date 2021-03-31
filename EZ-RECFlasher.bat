
chcp 65001
echo off
cls
setlocal enabledelayedexpansion
:getSystemInfo
for /f "tokens=3 delims=n*." %%p in ('ver^') do (
    set WindowsVer=%%p
)
powershell.exe $PSVersionTable> PSVer.info
for /f "skip=3 tokens=2 delims= " %%p in (PSVer.info) do (
    set PSVersion=%%p
    goto systemInfoCheck
)


:systemInfoCheck
title Error: PowerShell version is too low.
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
if %WindowsVer% LSS 10 (
    set LangChoice=1
    goto QuickLangSetting
)


:linkConfigurate
set sourcesListURL=[Edit source list in here]
set ADBToolsURL=https://dl.google.com/android/repository/platform-tools-latest-windows.zip
set offlineMode=false


:langSelect
title Please select a language
echo ----------------------------------------------------------------------------------------------------
echo            Please select a language:
echo, 
echo                1.English / 英语
echo                2.Simplified Chinese / 简体中文
echo, 
echo ----------------------------------------------------------------------------------------------------
choice /c 12
set langChoice=%errorlevel%
:QuickLangSetting
if %langChoice%==1 (
    set langBreadcrumbSelect=Select
    set langBreadcrumbDownload=Download
    set langBreadcrumbConfirm=Confirm
    set langBreadcrumbFlashing=Flashing
    set langBreadcrumbComplete=Complete
    set langBreadcrumbFailed=Failed
    set langWelcome=Welcome to
    set langLogoAttention=Pay Attention in Flashing！
    set langTitle=Easy flash Recovery
    set langAnyKeyRetry=Press any key to retry
    set langPrevious=Previous
    set langNext=Next
    set langOfflineMode=Offline mode
    set langGetSourceList=Getting sources list
    set langGetSourceListFailed=Download sources list failed！
    set langGetSourceListFailedDesc=To activate the offline mode, you need to create a new folder call "recoverys" in this script directory and place the Recovery files into the folder.
    set langSourceListTitle=Please select a recovery you wanna flash
    set langDeviceCode=Device Code
    set langRecoveryName=Recovery Name
    set langRecoveryVersion=Recovery Version
    set langRecoveryAuthor=Recovery Author
    set langRelaeseDate=Relaese Date
    set langWannaTryOffline=Do you wanna enter offline mode?
    set langOfflineIsZip=Is it a .zip compressed package
    set langOfflineFileName=Local file name
    set langConfirmTitle=Please confirm the recovery details
    set langConfirmdesc=Please check the information carefully！
    set langConfirmYN=Is the information correct
    set langDownloading=Downloading
    set langDownloadRecoveryCheck=Checking selected Recovery
    set langDownloadRecoveryExist=Selected Recovery already exists.
    set langDownloadRecoveryFailed=Download selected recovery failed！
    set langDownloadADBCheck=Checking Android Debug Bridge
    set langDownloadADB=Android Debug Bridge Doesn't exist！Start Download
    set langDownloadADBFailed=Download Android Debug Bridge failed！
    set langExpandingADB=Expanding Android Debug Bridge
    set langADBAlreadyExist=Android Debug Bridge already exists.
    set langExpandingZIP=Expanding Zip file
    set langCheckDevicePlugin=Checking device connection, Please connect your device to your computer
    set langADBDeviceDetected=ADB device detected！
    set langADBDeviceUndetected=ADB device undetected.
    set langFastbootDeviceDetected=Fastboot device detected！
    set langFastbootDeviceUndetected=Fastboot device undetected.
    set langRebootingToFastboot=Rebooting device to the Fastboot mode
    set langFlashingRecovery=Flashing selected Recovery
    set langDoneTitle=Done！
    set langRebootToFastboot=Do you wanna reboot the device to recovery
    set langFailedTitle=Flash failed！
    set langFailedDesc1=Please check
    set langFailedDesc2=The device code/model is or not correct.
    set langFailedDesc3=Make sure the device's Bootloader is unlocked.
    set langFailedDesc4=Selected Recovery file is or not integrity.
    set langFailedDesc5=If still failed, please contact script auther/recovery author
    set langFailedRetry=Do you wanna try again?
    set langFailedExit=and hope will be better in next time.
)
if %langChoice%==2 (
    set langBreadcrumbSelect=选择

    set langBreadcrumbDownload=下载

    set langBreadcrumbConfirm=确认

    set langBreadcrumbFlashing=刷入

    set langBreadcrumbComplete=完成

    set langBreadcrumbFailed=失败

    set langWelcome=欢迎使用

    set langLogoAttention=刷机有风险，玩机需谨慎。

    set langTitle=一键刷入 Recovery 脚本
    
    set langAnyKeyRetry=按任意键重试

    set langPrevious=上一页

    set langNext=下一页

    set langOfflineMode=离线模式

    set langGetSourceList=正在获取源数据列表

    set langGetSourceListFailed=获取源数据列表失败！

    set langGetSourceListFailedDesc=若要运行离线模式，请在本脚本目录下新建 “recoverys” 文件夹并将欲刷入的 Recovery 文件放入文件夹内。
    
    set langSourceListTitle=请选择欲刷入的 Recovery

    set langDeviceCode=设备代码

    set langRecoveryName=Recovery 名称

    set langRecoveryVersion=Recovery 版本

    set langRecoveryAuthor=Recovery 作者

    set langRelaeseDate=发布日期
    
    set langWannaTryOffline=是否进入离线模式?

    set langOfflineIsZip=是否为 .zip 压缩包

    set langOfflineFileName=本地文件名

    set langConfirmTitle=请确认详细信息

    set langConfirmdesc=请认真检查以上信息！

    set langConfirmYN=以上信息是否正确

    set langDownloading=正在下载

    set langDownloadRecoveryCheck=正在检查已选的 Recovery

    set langDownloadRecoveryExist=已选择的 Recovery 已经存在。

    set langDownloadRecoveryFailed=下载已选择的 Recovery 失败！

    set langDownloadADBCheck=正在检查 Android Debug Bridge

    set langDownloadADB=Android Debug Bridge 不存在！开始下载

    set langDownloadADBFailed=下载 Android Debug Bridge 失败！

    set langExpandingADB=正在解压 Android Debug Bridge

    set langADBAlreadyExist=Android Debug Bridge 已经存在。

    set langExpandingZIP=正在解压 Zip 类型文件

    set langCheckDevicePlugin=正在检查设备连接，请插入设备至当前计算机内

    set langADBDeviceDetected=已检测到 ADB 设备连接！

    set langADBDeviceUndetected=未检测到 ADB 设备连接。

    set langFastbootDeviceDetected=已检测到 Fastboot 设备连接！

    set langFastbootDeviceUndetected=未检测到 Fastboot 设备连接。

    set langRebootingToFastboot=正在重启手机至 Fastboot 模式

    set langFlashingRecovery=开始刷入已选择的 Recovery

    set langDoneTitle=大功告成！

    set langRebootToFastboot=是否将设备重启至 Recovery

    set langFailedTitle=刷入失败！

    set langFailedDesc1=请检查

    set langFailedDesc2=设备代码/型号是否正确。

    set langFailedDesc3=确保设备的 Bootloader 已解锁。

    set langFailedDesc4=选择的 Recovery 文件是否完整。

    set langFailedDesc5=若仍失败，请联系 脚本/Recovery 作者。

    set langFailedRetry=是否重试

    set langFailedExit=希望下次能让您满意！
)


:Logo
cls
title %langWelcome% %langTitle%
echo  ____    ________            ____    ____    ____      
echo /\  _`\ /\_____  \          /\  _`\ /\  _`\ /\  _`\    
echo \ \ \L\_\/____//'/'         \ \ \L\ \ \ \L\_\ \ \/\_\  
echo  \ \  _\L    //'/'    _______\ \ ,  /\ \  _\L\ \ \/_/_ 
echo   \ \ \L\ \ //'/'___ /\______\\ \ \\ \\ \ \L\ \ \ \L\ \
echo    \ \____/ /\_______\/______/ \ \_\ \_\ \____/\ \____/
echo     \/___/  \/_______/          \/_/\/ /\/___/  \/___/ 
echo,
echo  ____    ___                     __                      
echo /\  _`\ /\_ \                   /\ \                     
echo \ \ \L\_\//\ \      __      ____\ \ \___      __   _ __  
echo  \ \  _\/ \ \ \   /'__`\   /',__\\ \  _ `\  /'__`\/\`'__\
echo   \ \ \/   \_\ \_/\ \L\.\_/\__, `\\ \ \ \ \/\  __/\ \ \/ 
echo    \ \_\   /\____\ \__/.\_\/\____/ \ \_\ \_\ \____\\ \_\ 
echo     \/_/   \/____/\/__/\/_/\/___/   \/_/\/_/\/____/ \/_/ 
echo,
echo                       EZ-RECFlasher
echo                    Design by SummonHIM.
echo                   %langLogoAttention%
echo          https://github.com/SummonHIM/EZ-RECFlasher
timeout /t 3 /nobreak >NUL
cls


:step1Select
title %langTitle%
cls
echo ----------------------------------------------------------------------------------------------------
echo *   [%langBreadcrumbSelect%]   *    %langBreadcrumbConfirm%    *    %langBreadcrumbDownload%    *    %langBreadcrumbFlashing%    *    %langBreadcrumbComplete%    *
echo ----------------------------------------------------------------------------------------------------
echo %langGetSourceList%...
if exist sources.list ( del sources.list )
powershell Invoke-WebRequest "%SourcesListURL%" -OutFile "sources.list"
if not exist sources.list (
    if exist recoverys (
        goto offlineModeChoice
    ) else (
        echo,
        echo %langGetSourceListFailed%
        echo %langGetSourceListFailedDesc%
        echo,
        echo %langAnyKeyRetry%...
        pause>nul
        goto step1Select
    )
)
set pageOfList=1
:getSourceListDone
cls
echo ----------------------------------------------------------------------------------------------------
echo *   [%langBreadcrumbSelect%]   *    %langBreadcrumbConfirm%    *    %langBreadcrumbDownload%    *    %langBreadcrumbFlashing%    *    %langBreadcrumbComplete%    *
echo ----------------------------------------------------------------------------------------------------
echo      %langSourceListTitle%...
echo ----------------------------------------------------------------------------------------------------
if %pageOfList% LEQ 0 (
    set pageOfList=1
)
set deviceCodeLID=0
set "deviceCodeChoiceOptions="
for /f "skip=%pageOfList% delims=# tokens=1" %%a in (sources.list) do (
    if !deviceCodeLID!==9 (
        goto getDeviceCodeDone
    )
    set /a deviceCodeLID+=1
    set "deviceCodeOptions[!deviceCodeLID!]=%%a"
    set deviceCodeChoiceOptions=!deviceCodeChoiceOptions!!deviceCodeLID!
)
:getDeviceCodeDone
set recoveryNameLID=0
set "recoveryNameChoiceOptions="
for /f "skip=%pageOfList% delims=# tokens=2" %%a in (sources.list) do (
    if !recoveryNameLID!==9 (
        goto getRecoveryNameDone
    )
    set /a recoveryNameLID+=1
    set "recoveryNameOptions[!recoveryNameLID!]=%%a"
    set recoveryNameChoiceOptions=!recoveryNameChoiceOptions!!recoveryNameLID!
)
:getRecoveryNameDone
set recoveryVersionLID=0
set "recoveryVersionChoiceOptions="
for /f "skip=%pageOfList% delims=# tokens=3" %%a in (sources.list) do (
    if !recoveryVersionLID!==9 (
        goto getRecoveryVersionDone
    )
    set /a recoveryVersionLID+=1
    set "recoveryVersionOptions[!recoveryVersionLID!]=%%a"
    set recoveryVersionChoiceOptions=!recoveryVersionChoiceOptions!!recoveryVersionLID!
)
:getRecoveryVersionDone
set recoveryAuthorLID=0
set "recoveryAuthorChoiceOptions="
for /f "skip=%pageOfList% delims=# tokens=4" %%a in (sources.list) do (
    if !recoveryAuthorLID!==9 (
        goto getRecoveryAuthorDone
    )
    set /a recoveryAuthorLID+=1
    set "recoveryAuthorOptions[!recoveryAuthorLID!]=%%a"
    set recoveryAuthorChoiceOptions=!recoveryAuthorChoiceOptions!!recoveryAuthorLID!
)
:getRecoveryAuthorDone
set relaeseDateLID=0
set "relaeseDateChoiceOptions="
for /f "skip=%pageOfList% delims=# tokens=5" %%a in (sources.list) do (
    if !relaeseDateLID!==9 (
        goto getRelaeseDateDone
    )
    set /a relaeseDateLID+=1
    set "relaeseDateOptions[!relaeseDateLID!]=%%a"
    set relaeseDateChoiceOptions=!relaeseDateChoiceOptions!!relaeseDateLID!
)
:getRelaeseDateDone
set downloadLinkLID=0
set "downloadLinkChoiceOptions="
for /f "skip=%pageOfList% delims=# tokens=6" %%a in (sources.list) do (
    if !downloadLinkLID!==9 (
        goto getDownloadLinkDone
    )
    set /a downloadLinkLID+=1
    set "downloadLinkOptions[!downloadLinkLID!]=%%a"
    set downloadLinkChoiceOptions=!downloadLinkChoiceOptions!!downloadLinkLID!
)
:getDownloadLinkDone
set fileTypeLID=0
set "fileTypeChoiceOptions="
for /f "skip=%pageOfList% delims=# tokens=7" %%a in (sources.list) do (
    if !fileTypeLinkLID!==9 (
        goto getFileTypeDone
    )
    set /a fileTypeLID+=1
    set "fileTypeOptions[!fileTypeLID!]=%%a"
    set fileTypeChoiceOptions=!fileTypeChoiceOptions!!fileTypeLID!
)
:getFileTypeDone
for /L %%A in (1,1,!recoveryVersionLID!) do echo [%%A]: %langDeviceCode%:!deviceCodeOptions[%%A]!, %langRecoveryName%:!recoveryNameOptions[%%A]!, %langRecoveryVersion%:!recoveryVersionOptions[%%A]!, %langRecoveryAuthor%:!recoveryAuthorOptions[%%A]! ,%langRelaeseDate%:!relaeseDateOptions[%%A]!.
echo,
set /a pageOfListEnd=%pageOfList%+8
echo [N]:%langPrevious% (%pageOfList% - %pageOfListEnd%) [M]:%langNext%
choice /c:!recoveryVersionChoiceOptions!nm /n /m "%langSourceListTitle%: "
set recoveryVersionChoiceErrorlevel=%errorlevel%
set /a whereIsNLevel=%recoveryVersionLID%+1
set /a whereIsMLevel=%recoveryVersionLID%+2
if %recoveryVersionChoiceErrorlevel%==%whereIsNLevel% (
    set /a pageOfList-=9
    goto getSourceListDone
)
if %recoveryVersionChoiceErrorlevel%==%whereIsMLevel% (
    if %whereIsMLevel% NEQ 11 (
        goto getSourceListDone
    ) else (
        set /a pageOfList+=9
        goto getSourceListDone
    )
    
)
goto step2Confirm


:offlineModeChoice
echo %langGetSourceListFailed%
choice /m "%langWannaTryOffline%"
set tryOfflineChoice=%errorlevel%
if %tryOfflineChoice%==1 (
    set offlineMode=true
    set pageOfOfflineList=1
)
if %tryOfflineChoice%==2 (
    goto step1Select
)
:offlineList
cls
echo ----------------------------------------------------------------------------------------------------
echo *   [%langBreadcrumbSelect%]   *    %langBreadcrumbConfirm%    *    %langBreadcrumbDownload%    *    %langBreadcrumbFlashing%    *    %langBreadcrumbComplete%    *
echo ----------------------------------------------------------------------------------------------------
echo      %langSourceListTitle% (%langOfflineMode%)...
echo ----------------------------------------------------------------------------------------------------
echo line1>offlineDir.txt
dir /a:-d /b recoverys>>offlineDir.txt
if %pageOfOfflineList% LEQ 0 (
    set pageOfOfflineList=1
)
set offlineFileListLID=0
set "offlineFileListChoiceOptions="
for /f "skip=%pageOfOfflineList% delims=" %%a in (offlineDir.txt) do (
    if !offlineFileListLID!==9 (
        goto getOfflineFileListDone
    )
    set /a offlineFileListLID+=1
    set "offlineFileListOptions[!offlineFileListLID!]=%%a"
    set offlineFileListChoiceOptions=!offlineFileListChoiceOptions!!offlineFileListLID!
)
:getOfflineFileListDone
del offlineDir.txt
for /L %%A in (1,1,!offlineFileListLID!) do echo [%%A]: !offlineFileListOptions[%%A]!.
echo,
set /a pageOfOfflineListEnd=%pageOfOfflineList%+8
echo [N]:%langPrevious% (%pageOfOfflineList% - %pageOfOfflineListEnd%) [M]:%langNext%
choice /c:!offlineFileListChoiceOptions!nm /n /m "%langSourceListTitle%: "
set offlineFileListChoiceErrorlevel=%errorlevel%
set /a whereIsNLevel=%offlineFileListLID%+1
set /a whereIsMLevel=%offlineFileListLID%+2
if %offlineFileListChoiceErrorlevel%==%whereIsNLevel% (
    set /a pageOfOfflineList-=9
    goto offlineList
)
if %offlineFileListChoiceErrorlevel%==%whereIsMLevel% (
    if %whereIsMLevel% NEQ 11 (
        goto offlineList
    ) else (
        set /a pageOfOfflineList+=9
        goto offlineList
    )
    
)
choice /m "%langOfflineIsZip%?"
set isZipOfflineChoice=%errorlevel%
if %isZipOfflineChoice%==1 (
    set isZipOffline=true
)
if %isZipOfflineChoice%==2 (
    set isZipOffline=false
)


:step2Confirm
cls
echo ----------------------------------------------------------------------------------------------------
echo *    %langBreadcrumbSelect%    *   [%langBreadcrumbConfirm%]   *    %langBreadcrumbDownload%    *    %langBreadcrumbFlashing%    *    %langBreadcrumbComplete%    *
echo ----------------------------------------------------------------------------------------------------
echo       %langConfirmTitle%: 
echo ----------------------------------------------------------------------------------------------------
if %offlineMode% == true (
    echo %langOfflineFileName%: !offlineFileListOptions[%offlineFileListChoiceErrorlevel%]!
    echo %langOfflineIsZip%: %isZipOffline%
)
if %offlineMode% == false (
    echo %langDeviceCode%: !deviceCodeOptions[%recoveryVersionChoiceErrorlevel%]!
    echo %langRecoveryName%: !recoveryNameOptions[%recoveryVersionChoiceErrorlevel%]!
    echo %langRecoveryVersion%: !recoveryVersionOptions[%recoveryVersionChoiceErrorlevel%]!
    echo %langRecoveryAuthor%: !recoveryAuthorOptions[%recoveryVersionChoiceErrorlevel%]!
    echo %langRelaeseDate%: !relaeseDateOptions[%recoveryVersionChoiceErrorlevel%]!
)
echo,
echo %langConfirmdesc%
choice /m "%langConfirmYN%?"
set confirmCorrectChoice=%errorlevel%
if %confirmCorrectChoice% == 1 (
    goto step3Download
)
if %confirmCorrectChoice% == 2 (
    goto step1Select
)


:step3Download
cls
echo ----------------------------------------------------------------------------------------------------
echo *    %langBreadcrumbSelect%    *    %langBreadcrumbConfirm%    *   [%langBreadcrumbDownload%]   *    %langBreadcrumbFlashing%    *    %langBreadcrumbComplete%    *
echo ----------------------------------------------------------------------------------------------------
if %offlineMode% == true (
    goto downloadADB
)
echo %langDownloadRecoveryCheck%...
if not exist recoverys (
    mkdir recoverys
)
set downloadingFileName=!deviceCodeOptions[%recoveryVersionChoiceErrorlevel%]!_!recoveryNameOptions[%recoveryVersionChoiceErrorlevel%]!_!recoveryVersionOptions[%recoveryVersionChoiceErrorlevel%]!_!recoveryAuthorOptions[%recoveryVersionChoiceErrorlevel%]!_!relaeseDateOptions[%recoveryVersionChoiceErrorlevel%]!
if exist "recoverys\%downloadingFileName%_recovery.!fileTypeOptions[%recoveryVersionChoiceErrorlevel%]!" (
    echo %langDownloadRecoveryExist%
) else (
    echo %langDownloading% !downloadLinkOptions[%recoveryVersionChoiceErrorlevel%]!...
    powershell Invoke-WebRequest "!downloadLinkOptions[%recoveryVersionChoiceErrorlevel%]!" -OutFile "recoverys\%downloadingFileName%_recovery.!fileTypeOptions[%recoveryVersionChoiceErrorlevel%]!"
)
if not exist "recoverys\%downloadingFileName%_recovery.!fileTypeOptions[%recoveryVersionChoiceErrorlevel%]!" (
    echo,
    echo %langDownloadRecoveryFailed%
    echo %langAnyKeyRetry%...
    pause>nul
    goto step3Download
)


:downloadADB
echo,
echo %langDownloadADBCheck%...
if not exist platform-tools (
    echo %langDownloadADB%...
    powershell Invoke-WebRequest "%ADBToolsURL%" -OutFile "platform-tools-latest-windows.zip" 
    echo %langExpandingADB%...
    powershell Expand-Archive -Path platform-tools-latest-windows.zip -DestinationPath %~dp0
    del platform-tools-latest-windows.zip
) else (
    echo %langADBAlreadyExist%
)
if not exist platform-tools\adb.exe (
    echo,
    echo %langDownloadADBFailed%
    echo %langAnyKeyRetry%...
    pause>nul
    goto step3Download
)


:step4Flashing
cls
echo ----------------------------------------------------------------------------------------------------
echo *    %langBreadcrumbSelect%    *    %langBreadcrumbConfirm%    *    %langBreadcrumbDownload%    *   [%langBreadcrumbFlashing%]   *    %langBreadcrumbComplete%    *
echo ----------------------------------------------------------------------------------------------------
if exist expanded_Rec (
    rmdir /s /q expanded_Rec >nul
)
if !fileTypeOptions[%recoveryVersionChoiceErrorlevel%]! == zip (
    echo %langExpandingZIP%...
    powershell Expand-Archive -Path "recoverys\%downloadingFileName%_recovery.!fileTypeOptions[%recoveryVersionChoiceErrorlevel%]!" -DestinationPath %~dp0\expanded_Rec
)
if "%isZipOffline%" == "true" (
    echo %langExpandingZIP%...
    powershell Expand-Archive -Path "recoverys\!offlineFileListOptions[%offlineFileListChoiceErrorlevel%]!" -DestinationPath %~dp0\expanded_Rec
)
if !fileTypeOptions[%recoveryVersionChoiceErrorlevel%]! == zip (
    set selectedIMGFile=expanded_Rec\recovery.img
) else (
    set selectedIMGFile=recoverys\%downloadingFileName%_recovery.!fileTypeOptions[%recoveryVersionChoiceErrorlevel%]!
)
if %offlineMode% == true (
    if "%isZipOffline%" == "true" (
        set selectedIMGFile=expanded_Rec\recovery.img
    ) else (
        set selectedIMGFile=recoverys\!offlineFileListOptions[%offlineFileListChoiceErrorlevel%]!
    )
)


:checkDevicePlugin
cls
echo ----------------------------------------------------------------------------------------------------
echo *    %langBreadcrumbSelect%    *    %langBreadcrumbConfirm%    *    %langBreadcrumbDownload%    *   [%langBreadcrumbFlashing%]   *    %langBreadcrumbComplete%    *
echo ----------------------------------------------------------------------------------------------------
echo %langCheckDevicePlugin%...
platform-tools\adb.exe devices|findstr /e "device"
set adbOnline=%errorlevel%
platform-tools\fastboot.exe devices|findstr /e "fastboot"
set fastbootOnline=%errorlevel%
if %adbOnline% == 0 (
    echo %langADBDeviceDetected%
    goto inADBMode
) else (
    echo %langADBDeviceUndetected%
)
if %fastbootOnline% == 0 (
    echo %langFastbootDeviceDetected%
    goto startFlashing
) else (
    echo %langFastbootDeviceUndetected%
)

timeout /t 1 /nobreak >NUL
goto checkDevicePlugin


:inADBMode
echo,
echo %langRebootingToFastboot%...
platform-tools\adb.exe reboot bootloader >nul
timeout /t 5 /nobreak >NUL
goto checkDevicePlugin


:startFlashing
echo,
echo %langFlashingRecovery%: %selectedIMGFile%...
platform-tools\fastboot.exe flash recovery "%selectedIMGFile%"
if %errorlevel% NEQ 0 ( goto flashFailed )
timeout /t 5 /nobreak >NUL


:step5Complete
rmdir /s /q expanded_Rec >nul
cls
echo ----------------------------------------------------------------------------------------------------
echo *    %langBreadcrumbSelect%    *    %langBreadcrumbConfirm%    *    %langBreadcrumbDownload%    *    %langBreadcrumbFlashing%    *   [%langBreadcrumbComplete%]   *
echo ----------------------------------------------------------------------------------------------------
echo      %langDoneTitle%
echo ----------------------------------------------------------------------------------------------------
choice /m "%langRebootToFastboot%"
set rebootRecoveryChoice=%errorlevel%
if %rebootRecoveryChoice% == 1 (
    platform-tools\fastboot.exe reboot recovery
)
echo,
echo,
echo  ____                    __                        
echo /\  _`\                 /\ \                       
echo \ \ \L\ \  __  __     __\ \ \____  __  __     __   
echo  \ \  _ ' /\ \/\ \  /'__`\ \ '__`\/\ \/\ \  /'__`\ 
echo   \ \ \L\ \ \ \_\ \/\  __/\ \ \L\ \ \ \_\ \/\  __/ 
echo    \ \____/\/`____ \ \____\\ \_,__/\/`____ \ \____\
echo     \/___/  `/___/  \/____/ \/___/  `/___/  \/____/
echo                /\___/                  /\___/      
echo                \/__/                   \/__/       
timeout /t 3 /nobreak >NUL
exit


:flashFailed
rmdir /s /q expanded_Rec >nul
cls
echo ----------------------------------------------------------------------------------------------------
echo *    %langBreadcrumbSelect%    *    %langBreadcrumbConfirm%    *    %langBreadcrumbDownload%    *    %langBreadcrumbFlashing%    *   [%langBreadcrumbFailed%]   *
echo ----------------------------------------------------------------------------------------------------
echo      %langFailedTitle%
echo ----------------------------------------------------------------------------------------------------
echo %langFailedDesc1%: 
echo              1. %langFailedDesc2%
echo              2. %langFailedDesc3%
echo              3. %langFailedDesc4%
echo %langFailedDesc5%
choice /m "%langFailedRetry%?"
set failedRetryChoice=%errorlevel%
if %failedRetryChoice% == 1 (
    goto step1Select
)
echo,
echo,
echo  ____                    __                        
echo /\  _`\                 /\ \                       
echo \ \ \L\ \  __  __     __\ \ \____  __  __     __   
echo  \ \  _  '/\ \/\ \  /'__`\ \ '__`\/\ \/\ \  /'__`\ 
echo   \ \ \L\ \ \ \_\ \/\  __/\ \ \L\ \ \ \_\ \/\  __/ 
echo    \ \____/\/`____ \ \____\\ \_,__/\/`____ \ \____\
echo     \/___/  `/___/  \/____/ \/___/  `/___/  \/____/
echo                /\___/                  /\___/      
echo                \/__/                   \/__/       
echo %langFailedExit%
timeout /t 3 /nobreak >NUL
exit