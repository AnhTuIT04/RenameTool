@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Bạn phải chỉ định thư mục làm tham số đầu vào.
    exit /b 1
)

set "directory=%~1"
set "prefix=%~2"
set "postfix=%~3"

if not exist "%directory%" (
    echo Folder !directory! không tồn tại.
    exit /b 1
)

if "!prefix!" == "~" (
    set "prefix="
)

if "!postfix!" == "~" (
    set "postfix="
)

set counter=1

for %%f in ("%directory%\*") do (
    if exist "%%f" (
        set "extension=%%~xf"

        rename "%%f" "%prefix%!counter!%postfix%!extension!"

        set /a counter+=1
    )
)

endlocal
exit /b 0
