cls
set TMP=%cd%
cls

@ECHO OFF

@echo $User = Read-Host -Prompt 'Nume utilizator'> %TMP%\AskUserMapDrives1.ps1
@echo $Pass = Read-Host -Prompt 'Parola utilizator'>> %TMP%\AskUserMapDrives1.ps1

@echo $publicshare = "\\172.16.110.2\public"
@echo $scanshare = "\\172.16.110.2\scan"
@echo $usershare = "\\172.16.110.2\$User"

@echo clear>> %TMP%\AskUserMapDrives1.ps1

@echo IF (Test-Path P: = "True"){>> %TMP%\AskUserMapDrives1.ps1
@echo 	NET USE P: /delete>> %TMP%\AskUserMapDrives1.ps1
@echo   clear>> %TMP%\AskUserMapDrives1.ps1
@echo }

@echo IF (Test-Path S: = "True"){>> %TMP%\AskUserMapDrives1.ps1
@echo 	NET USE S: /delete>> %TMP%\AskUserMapDrives1.ps1
@echo   clear>> %TMP%\AskUserMapDrives1.ps1
@echo }

@echo IF (Test-Path H: = "True"){>> %TMP%\AskUserMapDrives1.ps1
@echo 	NET USE H: /delete>> %TMP%\AskUserMapDrives1.ps1
@echo   clear>> %TMP%\AskUserMapDrives1.ps1
@echo }

@echo 	Start-Process PowerShell -windowstyle hidden -ArgumentList "Restart-Service -Name Workstation -Force" -Wait -Verb RunAs>> %TMP%\AskUserMapDrives1.ps1

@echo   NET USE P: $publicshare $Pass /USER:$User>> %TMP%\AskUserMapDrives1.ps1
@echo   NET USE S: $scanshare $Pass /USER:$User>> %TMP%\AskUserMapDrives1.ps1
@echo   NET USE H: $usershare $Pass /USER:$User>> %TMP%\AskUserMapDrives1.ps1

@echo   clear>> %TMP%\AskUserMapDrives1.ps1
@echo }>> %TMP%\AskUserMapDrives1.ps1

SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%AskUserMapDrives1.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";

del %TMP%\AskUserMapDrives1.ps1

cls
ping 127.0.0.1 -n 2 > nul
echo .
ping 127.0.0.1 -n 2 > nul
cls
echo " .----------------.  .----------------.  .----------------.  .----------------. ";
echo "| .--------------. || .--------------. || .--------------. || .--------------. |";
echo "| |     _____    | || |  _________   | || |   _    _     | || |    _____     | |";
echo "| |    |_   _|   | || | |  _   _  |  | || |  | |  | |    | || |   / ___ \`.   | |";
echo "| |      | |     | || | |_/ | | \_|  | || |  | |__| |_   | || |  |_/___) |   | |";
echo "| |      | |     | || |     | |      | || |  |____   _|  | || |   .'____.'   | |";
echo "| |     _| |_    | || |    _| |_     | || |      _| |_   | || |  / /____     | |";
echo "| |    |_____|   | || |   |_____|    | || |     |_____|  | || |  |_______|   | |";
echo "| |              | || |              | || |              | || |              | |";
echo "| '--------------' || '--------------' || '--------------' || '--------------' |";
echo " '----------------'  '----------------'  '----------------'  '----------------' ";
ping 127.0.0.1 -n 3 > nul




