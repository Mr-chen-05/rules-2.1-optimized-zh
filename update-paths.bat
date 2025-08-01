@echo off
chcp 65001 >nul
echo 正在批量更新脚本中的路径引用...

REM 更新所有脚本文件中的路径引用
for %%f in (安装脚本\*.bat) do (
    if not "%%f"=="安装脚本\install-all.bat" (
        echo 正在更新: %%f
        powershell -Command "(Get-Content '%%f') -replace 'global-rules', '全局规则' -replace 'project-rules', '项目规则' | Set-Content '%%f' -Encoding UTF8"
    )
)

echo 路径更新完成！
pause
