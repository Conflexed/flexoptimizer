@echo off
setlocal EnableDelayedExpansion
color 04
title FLEX OPTIMIZER

:: ===== Admin Check =====
>nul 2>&1 net session
if %errorlevel% neq 0 (
    color 0C
    echo =========================================================
    echo   ERROR: This script must be run as ADMINISTRATOR!
    echo   Right-click the file and select "Run as administrator".
    echo =========================================================
    pause
    exit /b
)


:MENU
cls
echo ==================================================
echo             F L E X   O P T I M I Z E R
echo ==================================================
echo Boost your network performance with one click.
echo --------------------------------------------------
echo.
echo     [1] Apply TCP Settings Optimizations
echo     [2] Apply NetSH Optimizations
echo     [3] Apply QoS Optimizations
echo     [4] Force Restart Network Adapter
echo --------------------------------------------------
set /p choice=Choose an option (1-4): 

if "%choice%"=="1" goto TCP
if "%choice%"=="2" goto NETSH
if "%choice%"=="3" goto QOS
if "%choice%"=="4" goto RESTART
goto END
if "%choice%"=="1" goto TCP
if "%choice%"=="2" goto NETSH
if "%choice%"=="3" goto QOS
if "%choice%"=="4" goto RESTART
goto END

:TCP
echo.
echo -------- TCP SETTINGS OPTIMIZATIONS --------
echo Applying TCPNoDelay... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul
echo Applying TCPAckFrequency... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPAckFrequency /t REG_DWORD /d 1 /f >nul
echo Applying TCPDelAckTicks... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPDelAckTicks /t REG_DWORD /d 0 /f >nul
echo Applying TCPMaxConnectRetransmissions... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPMaxConnectRetransmissions /t REG_DWORD /d 3 /f >nul
echo Applying TCPTimedWaitDelay... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPTimedWaitDelay /t REG_DWORD /d 45 /f >nul
echo Applying MaxUserPort... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65534 /f >nul
echo Applying MaxFreeTCBs... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxFreeTCBs /t REG_DWORD /d 65536 /f >nul
echo Applying NetworkThrottlingIndex... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetworkThrottlingIndex /t REG_SZ /d FFFFFFFF /f >nul
echo Applying DisableTaskOffload... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 1 /f >nul
echo Applying DefaultTTL... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f >nul
echo Applying SackOps... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SackOps /t REG_DWORD /d 1 /f >nul
echo Applying TCPWindowSize... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPWindowSize /t REG_DWORD /d 65535 /f >nul
echo Applying GlobalMaxTCPWindowSize... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTCPWindowSize /t REG_DWORD /d 65535 /f >nul
echo Applying EnablePMTUBHDetect... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUBHDetect /t REG_DWORD /d 1 /f >nul
echo Applying EnableTCPA... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableTCPA /t REG_DWORD /d 1 /f >nul
echo Applying EnableRSS... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableRSS /t REG_DWORD /d 1 /f >nul
echo Applying NegativeCacheTime... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NegativeCacheTime /t REG_DWORD /d 5 /f >nul
echo Applying NetFailureCacheTime... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetFailureCacheTime /t REG_DWORD /d 5 /f >nul
echo Applying NetInfoCacheTime... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NetInfoCacheTime /t REG_DWORD /d 5 /f >nul
echo Applying FastSendDatagramThreshold... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v FastSendDatagramThreshold /t REG_DWORD /d 64000 /f >nul
echo Applying DynamicSendBufferDisable... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DynamicSendBufferDisable /t REG_DWORD /d 0 /f >nul
echo Applying NonBlockingSendSpecialBuffering... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NonBlockingSendSpecialBuffering /t REG_DWORD /d 1 /f >nul
echo Applying IgnorePushBitonRecieves... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v IgnorePushBitonRecieves /t REG_DWORD /d 1 /f >nul
echo Applying EnableFastRouteLookup... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableFastRouteLookup /t REG_DWORD /d 1 /f >nul
echo Applying DoNotUseNLA... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DoNotUseNLA /t REG_DWORD /d 0 /f >nul
echo Applying TCPMaxDataRetransmissions... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPMaxDataRetransmissions /t REG_DWORD /d 4 /f >nul
echo Applying TCPInitialRTT... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPInitialRTT /t REG_DWORD /d 200 /f >nul
echo Applying EnableDCA... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableDCA /t REG_DWORD /d 1 /f >nul
echo Applying UseZeroBroadcast... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v UseZeroBroadcast /t REG_DWORD /d 0 /f >nul
echo Applying DeadGWDetectDefault... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DeadGWDetectDefault /t REG_DWORD /d 1 /f >nul
echo Applying TCP1323Opts... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCP1323Opts /t REG_DWORD /d 1 /f >nul
echo Applying DelayedAckFrequency... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DelayedAckFrequency /t REG_DWORD /d 1 /f >nul
echo Applying CongestionAlgorithim... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v CongestionAlgorithim /t REG_DWORD /d 2 /f >nul
echo Applying SizReqBuf... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SizReqBuf /t REG_DWORD /d 17424 /f >nul
echo Applying TimerResolution... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TimerResolution /t REG_DWORD /d 1 /f >nul
echo Applying DisabledComponets... & reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisabledComponets /t REG_DWORD /d 0 /f >nul

echo.
echo TCP settings applied successfully.
goto ASK

:NETSH
echo.
echo -------- NETSH OPTIMIZATIONS --------
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int isatap set state disabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >nul 2>&1
netsh int tcp set global initialRto=2000 >nul 2>&1
netsh int tcp set supplemental template=custom icw=10 >nul 2>&1
netsh int ip set interface ethernet currenthoplimit=64 >nul 2>&1
echo.
echo NetSH settings applied successfully.
goto ASK

:QOS
echo.
echo -------- QOS OPTIMIZATIONS --------
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PrivateProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched\DiffServByteMappingNonConforming" /v "ServiceTypeNetworkControl" /t REG_DWORD /d "56" /f >nul 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched\DiffServByteMappingConforming" /v "ServiceTypeNetworkControl" /t REG_DWORD /d "56" /f >nul 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched\DiffServByteMappingNonConforming" /v "ServiceTypeGuaranteed" /t REG_DWORD /d "5" /f >nul 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched\DiffServByteMappingConforming" /v "ServiceTypeGuaranteed" /t REG_DWORD /d "46" /f >nul 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched\UserPriorityMapping" /v "ServiceTypeNetworkControl" /t REG_DWORD /d "7" /f >nul 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "MaxOutstandingSends" /t REG_DWORD /d "65000" /f >nul 2>&1
Reg.exe Add "HKLM\Software\Policies\Microsoft\Windows\Psched" /V "NonBestEffortLimit" /t REG_DWORD /d "0" /F >nul 2>&1
Reg.exe Add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\QoS" /V "Do not use NLA" /t REG_SZ /d "1" /F >nul 2>&1
Powershell -Command "Enable-NetAdapterBinding -Name '*' -ComponentID Ms_Pacer" >nul 2>&1
Netsh Int TCP Set Global AutoTuningLevel=Disabled >nul 2>&1
Netsh AdvFireWall Set AllProfiles State Off >nul 2>&1
SC Config Psched Start= Auto >nul 2>&1
SC Start Psched >nul 2>&1
echo.
echo QoS settings applied successfully.
goto ASK

:ASK
echo.
set /p again=Do you want to apply anything else? (Y/N): 
if /I "!again!"=="Y" goto MENU
if /I "!again!"=="N" goto RESTART
echo Invalid input. Returning to menu...
pause
goto MENU

:RESTART
echo.
echo Restarting network adapters...
powershell -Command "Get-NetAdapter | Restart-NetAdapter -Confirm:$false" >nul 2>&1
echo.
echo All operations complete. You may now close this window.
pause
exit /b

:END
echo.
echo Invalid selection. Exiting.
pause
exit /b
