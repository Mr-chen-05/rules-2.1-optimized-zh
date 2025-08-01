@echo off
chcp 65001 >nul
setlocal

REM Get the directory where this script is located
set "SCRIPT_DIR=%~dp0"
set "RULES_DIR=%SCRIPT_DIR%.."

echo ========================================
echo  Claude Code Frontend Rules Installer
echo ========================================

if "%~1"=="" (
    echo Usage: claude-frontend.bat [project-path]
    echo.
    echo Examples:
    echo   claude-frontend.bat ..\my-project
    echo   claude-frontend.bat C:\projects\demo
    echo   claude-frontend.bat .
    echo.
    goto :eof
)

set "PROJECT_PATH=%~1"

echo Installing Claude Code Frontend Rules to: %PROJECT_PATH%
echo.

REM Create combined CLAUDE.md file for frontend
echo Creating CLAUDE.md file...

echo # Claude Code Frontend Rules > "%PROJECT_PATH%\CLAUDE.md"
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\全局规则\frontend-rules-2.1.md" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

REM Append frontend rules
type "%RULES_DIR%\项目规则\frontend-dev.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\commit.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\code-review.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\bug-fix.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\mermaid.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\create-docs.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\implement-task.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

type "%RULES_DIR%\项目规则\feedback-enhanced.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)
echo. >> "%PROJECT_PATH%\CLAUDE.md"

REM Append MCP intelligent strategy rules (CRITICAL FOR AI EFFICIENCY)
type "%RULES_DIR%\项目规则\mcp-intelligent-strategy.mdc" >> "%PROJECT_PATH%\CLAUDE.md"
if errorlevel 1 (
    echo ERROR: File operation failed
    pause
    exit /b 1
)

echo.
echo Claude Code Frontend Rules installed successfully!
echo.
echo Available commands:
echo   /frontend-dev, /commit, /code-review, /bug-fix
echo   /mermaid, /create-docs, /implement-task
echo   /feedback
echo.
echo Rules file location: %PROJECT_PATH%\CLAUDE.md
echo.

REM Standard exit code handling for && || compatibility
cmd /c exit %ERRORLEVEL%
