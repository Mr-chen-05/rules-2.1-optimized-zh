@echo off
chcp 65001 >nul
setlocal

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "RULES_DIR=%SCRIPT_DIR%.."



echo ========================================
echo  Cursor Frontend Rules Installer
echo ========================================

if "%~1"=="" (
    echo Usage: cursor-frontend.bat [project-path]
    echo.
    echo Examples:
    echo   cursor-frontend.bat ..\my-project
    echo   cursor-frontend.bat C:\projects\demo
    echo   cursor-frontend.bat .
    echo.
    goto :eof
)

set PROJECT_PATH=%~1

echo Installing Cursor Frontend Rules to: %PROJECT_PATH%
echo.

REM Create Cursor directories
if not exist "%PROJECT_PATH%\.cursor" mkdir "%PROJECT_PATH%\.cursor"
if not exist "%PROJECT_PATH%\.cursor\rules" mkdir "%PROJECT_PATH%\.cursor\rules"

REM Copy individual rule files for Cursor
echo Copying frontend rule files...

copy /Y "%RULES_DIR%\项目规则\frontend-dev.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)

copy /Y "%RULES_DIR%\项目规则\commit.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)
copy /Y "%RULES_DIR%\项目规则\code-review.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)
copy /Y "%RULES_DIR%\项目规则\bug-fix.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)
copy /Y "%RULES_DIR%\项目规则\mermaid.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)
copy /Y "%RULES_DIR%\项目规则\create-docs.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)
copy /Y "%RULES_DIR%\项目规则\implement-task.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)
copy /Y "%RULES_DIR%\项目规则\feedback-enhanced.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)

REM Copy MCP intelligent strategy rules (CRITICAL FOR AI EFFICIENCY)
copy /Y "%RULES_DIR%\项目规则\mcp-intelligent-strategy.mdc" "%PROJECT_PATH%\.cursor\rules\" >nul
if errorlevel 1 (
    echo ERROR: Operation failed
    pause
    exit /b 1
)

echo.
echo Cursor Frontend Rules installed successfully!
echo.
echo Available commands:
echo   /frontend-dev, /commit, /code-review, /bug-fix
echo   /mermaid, /create-docs, /implement-task
echo   /feedback
echo.
echo Rules files location: %PROJECT_PATH%\.cursor\rules\
echo.

REM Standard exit code handling for && || compatibility
cmd /c exit %ERRORLEVEL%
