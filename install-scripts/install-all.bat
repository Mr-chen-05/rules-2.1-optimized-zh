@echo off
chcp 65001 >nul
setlocal

echo ========================================
echo  Rules 2.1 Optimized - All Tools Installer
echo ========================================

if "%~1"=="" (
    echo.
    echo Usage: install-all.bat [project-path] [type]
    echo.
    echo Install Types:
    echo   frontend   - Install frontend rules for all AI tools
    echo   backend    - Install backend rules for all AI tools
    echo   fullstack  - Install both frontend and backend rules
    echo.
    echo Examples:
    echo   install-all.bat ..\my-project frontend
    echo   install-all.bat C:\projects\demo backend
    echo   install-all.bat . fullstack
    echo.
    goto :eof
)

set "PROJECT_PATH=%~1"
set "INSTALL_TYPE=%~2"

if "%INSTALL_TYPE%"=="" set "INSTALL_TYPE=frontend"

echo Installing Rules 2.1 Optimized for ALL AI tools
echo Project Path: %PROJECT_PATH%
echo Install Type: %INSTALL_TYPE%
echo.

if /i "%INSTALL_TYPE%"=="frontend" (
    echo Installing Frontend Rules for all tools...
    echo.
    
    echo [1/4] Installing Augment Frontend Rules...
    call install-scripts\augment-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [2/4] Installing Cursor Frontend Rules...
    call install-scripts\cursor-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [3/4] Installing Claude Code Frontend Rules...
    call install-scripts\claude-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [4/4] Installing Trae AI Frontend Rules...
    call install-scripts\trae-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.
    
) else if /i "%INSTALL_TYPE%"=="backend" (
    echo Installing Backend Rules for all tools...
    echo.
    
    echo [1/4] Installing Augment Backend Rules...
    call install-scripts\augment-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [2/4] Installing Cursor Backend Rules...
    call install-scripts\cursor-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [3/4] Installing Claude Code Backend Rules...
    call install-scripts\claude-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [4/4] Installing Trae AI Backend Rules...
    call install-scripts\trae-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.
    
) else if /i "%INSTALL_TYPE%"=="fullstack" (
    echo Installing Fullstack Rules for all tools...
    echo.
    
    echo [1/8] Installing Augment Frontend Rules...
    call install-scripts\augment-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [2/8] Installing Augment Backend Rules...
    call install-scripts\augment-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [3/8] Installing Cursor Frontend Rules...
    call install-scripts\cursor-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [4/8] Installing Cursor Backend Rules...
    call install-scripts\cursor-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [5/8] Installing Claude Code Frontend Rules...
    call install-scripts\claude-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [6/8] Installing Claude Code Backend Rules...
    call install-scripts\claude-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [7/8] Installing Trae AI Frontend Rules...
    call install-scripts\trae-frontend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.

    echo [8/8] Installing Trae AI Backend Rules...
    call install-scripts\trae-backend.bat "%PROJECT_PATH%"
    if errorlevel 1 (
        echo ERROR: Installation script failed
        pause
        exit /b 1
    )
    echo.
    
) else (
    echo Error: Invalid install type "%INSTALL_TYPE%"
    echo Valid types: frontend, backend, fullstack
    goto :eof
)

echo ========================================
echo Installation Completed Successfully!
echo ========================================
echo.
echo Your project now supports ALL AI tools:
echo   Augment     - .augment/rules/
echo   Cursor      - .cursor/rules/
echo   Claude Code - CLAUDE.md
echo   Trae AI     - .trae/rules/
echo.
echo You can now use any of these AI tools with your project!
echo.

REM Standard exit code handling for && || compatibility
cmd /c exit %ERRORLEVEL%
