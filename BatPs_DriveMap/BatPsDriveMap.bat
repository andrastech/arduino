cls
@ECHO OFF
set TMP=%cd%
cls
DEL /F /A:H %TMP%\rdrive.ps1 2> nul
copy NUL %TMP%\rdrive.ps1 && attrib +h %TMP%\rdrive.ps1
cls


@echo $User = Read-Host -Prompt 'Nume utilizator'>> %TMP%\rdrive.ps1
@echo $Pass = Read-Host -Prompt 'Parola utilizator'>> %TMP%\rdrive.ps1
@echo $publicshare = "\\172.16.110.2\public">> %TMP%\rdrive.ps1
@echo $scanshare = "\\172.16.110.2\scan">> %TMP%\rdrive.ps1
@echo $usershare = "\\172.16.110.2\$User">> %TMP%\rdrive.ps1
@echo clear>> %TMP%\rdrive.ps1
@echo $checkPublicShare = "Test-Path P:">> %TMP%\rdrive.ps1
@echo $checkScanShare = "Test-Path S:">> %TMP%\rdrive.ps1
@echo $checkUserShare = "Test-Path X:">> %TMP%\rdrive.ps1
@echo IF ($checkPublicShare = "True"){>> %TMP%\rdrive.ps1
@echo 	NET USE P: /delete }>> %TMP%\rdrive.ps1
@echo   clear>> %TMP%\rdrive.ps1
@echo IF ($checkScanShare = "True"){>> %TMP%\rdrive.ps1
@echo 	NET USE S: /delete }>> %TMP%\rdrive.ps1
@echo   clear>> %TMP%\rdrive.ps1
@echo IF ($checkUserShare = "True"){>> %TMP%\rdrive.ps1
@echo 	NET USE H: /delete }>> %TMP%\rdrive.ps1
@echo   clear>> %TMP%\rdrive.ps1
@echo 	Start-Process PowerShell -windowstyle hidden -ArgumentList "Restart-Service -Name Workstation -Force" -Wait -Verb RunAs>> %TMP%\rdrive.ps1
@echo   NET USE P: $publicshare $Pass /USER:$User>> %TMP%\rdrive.ps1
@echo   NET USE S: $scanshare $Pass /USER:$User>> %TMP%\rdrive.ps1
@echo   NET USE H: $usershare $Pass /USER:$User>> %TMP%\rdrive.ps1
@echo   clear>> %TMP%\rdrive.ps1
SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%rdrive.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";
DEL /F /A:H %TMP%\rdrive.ps1 2> nul
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
ping 127.0.0.1 -n 2 > nul




