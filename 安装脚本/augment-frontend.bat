﻿@echo off
chcp 65001 >nul
setlocal

REM Get the directory where this script is located
set SCRIPT_DIR=%~dp0
set "RULES_DIR=%SCRIPT_DIR%.."

echo ========================================
echo  Augment Frontend Rules Installer
echo ========================================

if "%~1"=="" (
    echo Usage: augment-frontend.bat [project-path]
    echo.
    echo Examples:
    echo   augment-frontend.bat ..\my-project
    echo   augment-frontend.bat C:\projects\demo
    echo   augment-frontend.bat .
    echo.
    goto :eof
)

set PROJECT_PATH=%~1

echo Installing Augment Frontend Rules to: %PROJECT_PATH%
echo.

REM Create Augment directories
if not exist "%PROJECT_PATH%\.augment" mkdir "%PROJECT_PATH%\.augment"
if not exist "%PROJECT_PATH%\.augment\rules" mkdir "%PROJECT_PATH%\.augment\rules"

REM Create combined frontend rules file
echo Creating complete frontend rules file...

REM Start with global frontend rules
copy /Y "%RULES_DIR%\全局规则\frontend-rules-2.1.md" "%PROJECT_PATH%\.augment\rules\frontend-complete.md" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)

REM Append project rules
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
echo ## Additional Commands for Augment >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append commit rules
type "%RULES_DIR%\项目规则\commit.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append code review rules
type "%RULES_DIR%\项目规则\code-review.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append bug fix rules
type "%RULES_DIR%\项目规则\bug-fix.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append mermaid rules
type "%RULES_DIR%\项目规则\mermaid.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append create docs rules
type "%RULES_DIR%\项目规则\create-docs.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append implement task rules
type "%RULES_DIR%\项目规则\implement-task.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append feedback enhanced rules
type "%RULES_DIR%\项目规则\feedback-enhanced.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"

REM Append MCP intelligent strategy rules (CRITICAL FOR AI EFFICIENCY)
type "%RULES_DIR%\项目规则\mcp-intelligent-strategy.mdc" >> "%PROJECT_PATH%\.augment\rules\frontend-complete.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)

echo.
echo Augment Frontend Rules installed successfully!
echo.
echo Available commands:
echo   /frontend-dev, /component, /ui-design
echo   /commit, /code-review, /bug-fix
echo   /mermaid, /create-docs, /implement-task
echo   /feedback
echo.
echo Rules file location: %PROJECT_PATH%\.augment\rules\frontend-complete.md
echo.

REM Standard exit code handling for && || compatibility
cmd /c exit %ERRORLEVEL%
