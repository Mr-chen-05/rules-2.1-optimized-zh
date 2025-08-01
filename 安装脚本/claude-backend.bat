@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "RULES_DIR=%SCRIPT_DIR%.."

echo ========================================
echo  Claude Code Backend Rules Installer
echo ========================================

if "%~1"=="" (
    echo Usage: claude-backend.bat [project-path]
    echo.
    echo Examples:
    echo   claude-backend.bat ..\my-project
    echo   claude-backend.bat C:\projects\demo
    echo   claude-backend.bat .
    echo.
    goto :eof
)

set "PROJECT_PATH=%~1"

echo Installing Claude Code Backend Rules to: "%PROJECT_PATH%"
echo.

REM Create combined CLAUDE.md file for backend
echo Creating CLAUDE.md file...

echo # Claude Code Backend Rules > "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to create CLAUDE.md file
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to write to CLAUDE.md file
    pause
    exit /b 1
)

type "%RULES_DIR%\全局规则\backend-rules-2.1.md" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append backend-rules-2.1.md
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

REM Append backend rules
type "%RULES_DIR%\项目规则\backend-dev.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append backend-dev.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\commit.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append commit.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\code-review.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append code-review.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\bug-fix.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append bug-fix.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\analyze-issue.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append analyze-issue.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\create-docs.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append create-docs.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\implement-task.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append implement-task.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\feedback-enhanced.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append feedback-enhanced.mdc
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

REM Append MCP intelligent strategy rules (CRITICAL FOR AI EFFICIENCY)
type "%RULES_DIR%\项目规则\mcp-intelligent-strategy.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: Failed to append mcp-intelligent-strategy.mdc
    pause
    exit /b 1
)

echo.
echo Claude Code Backend Rules installed successfully!
echo.
echo Available commands:
echo   /backend-dev, /commit, /code-review, /bug-fix
echo   /analyze-issue, /create-docs, /implement-task
echo   /feedback
echo.
echo Rules file location: "%PROJECT_PATH%\CLAUDE.md"
echo.
echo Installation completed with enterprise-level error handling!

REM Standard exit code handling for && || compatibility
cmd /c exit %ERRORLEVEL%
