@echo off
setlocal enabledelayedexpansion

set "input=channel.txt"
set "output=channel.cfg"
if exist "%output%" del "%output%"

set /a count=0
set "line="

for /f "usebackq delims=" %%a in ("%input%") do (
    set /a count+=1
    if defined line (
        set "line=!line! "%%a""
    ) else (
        set "line="%%a""
    )
    if !count! equ 16 (
        echo log_flags !line! +DoNotEcho>>"%output%"
        set /a count=0
        set "line="
    )
)


if defined line (
    echo log_flags !line! +DoNotEcho>>"%output%"
)

echo Done! Output saved to %output%
pause
