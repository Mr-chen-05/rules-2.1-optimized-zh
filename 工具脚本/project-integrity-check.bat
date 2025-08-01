@echo off
chcp 65001 >nul
title Rules 2.1 Project Integrity Checker
color 0B

echo.
echo ========================================
echo   Rules 2.1 Project Integrity Checker
echo ========================================
echo.

echo Checking project integrity and localization status...
echo.

set "error_count=0"

echo [1/8] Checking directory structure...
echo ----------------------------------------
set "dirs=安装脚本 项目规则 全局规则 文档 教程 企业测试报告"
for %%d in (%dirs%) do (
    if exist "%%d" (
        echo [OK] Directory exists: %%d
    ) else (
        echo [ERROR] Directory missing: %%d
        set /a error_count+=1
    )
)
echo.

echo [2/8] Checking main documentation files...
echo ----------------------------------------
set "files=项目说明.md 使用指南.md 命令参考.md LICENSE"
for %%f in (%files%) do (
    if exist "%%f" (
        echo [OK] File exists: %%f
    ) else (
        echo [ERROR] File missing: %%f
        set /a error_count+=1
    )
)
echo.

echo [3/8] Checking installation scripts...
echo ----------------------------------------
set "scripts=install-all.bat augment-frontend.bat augment-backend.bat cursor-frontend.bat cursor-backend.bat claude-frontend.bat claude-backend.bat trae-frontend.bat trae-backend.bat"
for %%s in (%scripts%) do (
    if exist "安装脚本\%%s" (
        echo [OK] Script exists: %%s
    ) else (
        echo [ERROR] Script missing: %%s
        set /a error_count+=1
    )
)
echo.

echo [4/8] Checking rule files...
echo ----------------------------------------
if exist "全局规则\frontend-rules-2.1.md" (
    echo [OK] Frontend rules file exists
) else (
    echo [ERROR] Frontend rules file missing
    set /a error_count+=1
)

if exist "全局规则\backend-rules-2.1.md" (
    echo [OK] Backend rules file exists
) else (
    echo [ERROR] Backend rules file missing
    set /a error_count+=1
)

echo Project rules file count:
dir "项目规则\*.mdc" /b 2>nul | find /c ".mdc"
echo.

echo [5/8] Checking documentation completeness...
echo ----------------------------------------
set "docs=MCP-QUICK-START-GUIDE.md MCP-DETAILED-CONFIG-GUIDE.md MCP-TROUBLESHOOTING-GUIDE.md MCP-INTELLIGENT-USAGE-STRATEGY.md"
for %%d in (%docs%) do (
    if exist "文档\%%d" (
        echo [OK] Document exists: %%d
    ) else (
        echo [ERROR] Document missing: %%d
        set /a error_count+=1
    )
)
echo.

echo [6/8] Checking tutorial files...
echo ----------------------------------------
if exist "教程\frontend-rules-2.1-使用指南.md" (
    echo [OK] Frontend tutorial exists
) else (
    echo [ERROR] Frontend tutorial missing
    set /a error_count+=1
)

if exist "教程\backend-rules-2.1-使用指南.md" (
    echo [OK] Backend tutorial exists
) else (
    echo [ERROR] Backend tutorial missing
    set /a error_count+=1
)
echo.

echo [7/8] Checking path reference consistency...
echo ----------------------------------------
echo Searching for possible English path references...
findstr /s /i "install-scripts" *.md 2>nul
if errorlevel 1 (
    echo [OK] No English path references found: install-scripts
) else (
    echo [ERROR] Found English path references: install-scripts
    set /a error_count+=1
)

findstr /s /i "project-rules" *.md 2>nul
if errorlevel 1 (
    echo [OK] No English path references found: project-rules
) else (
    echo [ERROR] Found English path references: project-rules
    set /a error_count+=1
)

findstr /s /i "global-rules" *.md 2>nul
if errorlevel 1 (
    echo [OK] No English path references found: global-rules
) else (
    echo [ERROR] Found English path references: global-rules
    set /a error_count+=1
)
echo.

echo [8/8] Checking utility scripts...
echo ----------------------------------------
if exist "find-mcp-tools.bat" (
    echo [OK] MCP tools finder script exists
) else (
    echo [ERROR] MCP tools finder script missing
    set /a error_count+=1
)

if exist "project-integrity-check.bat" (
    echo [OK] Project integrity check script exists
) else (
    echo [ERROR] Project integrity check script missing
    set /a error_count+=1
)
echo.

echo ========================================
echo Check Complete!
echo ========================================
echo.

if %error_count%==0 (
    echo [SUCCESS] Project integrity check passed!
    echo * All files and directories exist
    echo * Path references fully localized
    echo * Project status: Production ready
) else (
    echo [FAILED] Found %error_count% issues
    echo * Please check items marked as [ERROR] above
    echo * Recommend running appropriate fixes
)

echo.
echo Project Statistics:
echo    - Directories: 6 main directories
echo    - Scripts: 9 installation scripts
echo    - Documents: 7 main documents
echo    - Rule files: 2 global rules + multiple project rules
echo.

pause
