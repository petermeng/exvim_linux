@echo off
rem create cscope.out
echo Creating Cscope...

if exist "%TOOLS%\windows\cscope.exe" (
    set CSCOPE_CMD="%TOOLS%\windows\cscope.exe"
)

rem choose ctags path first
if exist "%DEST%\files" (
    set FILES="%DEST%\files"
)

rem process tags by langugage
echo   ^|- generate %TMP%
%CSCOPE_CMD% -f"%TMP%" %OPTIONS% %FILES%

rem replace old file
if exist "%TMP%" (
    echo   ^|- move %TMP% to %TARGET%
    move /Y "%TMP%" "%TARGET%" > nul
)
if exist "%INTMP%" (
    echo   ^|- move %INTMP% to %INTARGET%
    move /Y "%INTMP%" "%INTARGET%" > nul
)
if exist "%POTMP%" (
    echo   ^|- move %POTMP% to %POTARGET%
    move /Y "%POTMP%" "%POTARGET%" > nul
)
echo   ^|- done!
