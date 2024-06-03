@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "source=folders.txt"
set "config=prefix_postfix.txt"

if not exist "%source%" (
    echo File !source! không tồn tại.
    pause
    exit /b 1
)

if not exist "%config%" (
    echo File !config! không tồn tại.
    pause
    exit /b 1
)

:: Start Handling ....

:: Read source file
set "folder_count=-1"
for /f "delims=" %%A in ('type "%source%"') do (
    set /a folder_count+=1
    set "folders[!folder_count!]=%%A"
)

:: Read config file
set "first_line="
for /f "delims=" %%A in ('type "%config%"') do (
    set "first_line=%%A"
    goto :get_config
)

:get_config
if "!first_line!" == "*" (
    set "config_count=-1"
    for /f "skip=1 delims=" %%A in ('type "%config%"') do (
	set /a config_count+=1
        set "line=%%A"
        set "line=!line:"=`!"
        for /f "tokens=1,2,3 delims=`" %%i in ("!line!") do (
            set "prefixes[!config_count!]=%%i"
            set "postfixes[!config_count!]=%%k"
        )
    )

    if !folder_count! neq !config_count! (
	echo Cấu hình sai, số lượng folder và config khác nhau.
	pause
	exit /b 1
    )
) else (
    set "line=!first_line!"
    set "line=!line:"=`!"
    for /f "tokens=1,2,3 delims=`" %%i in ("!line!") do (
        set "global_prefix=%%i"
        set "global_postfix=%%k"
    )
	
    for /l %%i in (0,1,!folder_count!) do (
        set "prefixes[%%i]=!global_prefix!"
        set "postfixes[%%i]=!global_postfix!"
    )
)

:: Calling rename.bat to handle rename for each folder

for /l %%i in (0,1,!folder_count!) do (
    set return_code=
    call :call_rename "!folders[%%i]!" "!prefixes[%%i]!" "!postfixes[%%i]!"

    if "!return_code!" == "0" (
	echo [THÀNH CÔNG]: !folders[%%i]!
    ) else (
 	echo [THẤT BẠI]: !folders[%%i]!
	call rename.bat "!folders[%%i]!" "!prefixes[%%i]!" "!postfixes[%%i]!"
    )
)

endlocal
pause
exit /b 0

:call_rename
call rename.bat %1 %2 %3 >nul
set return_code=%errorlevel%
exit /b