# 批量更新剩余脚本文件中的路径引用
$files = @(
    "安装脚本\claude-backend.bat",
    "安装脚本\cursor-frontend.bat", 
    "安装脚本\cursor-backend.bat",
    "安装脚本\trae-frontend.bat",
    "安装脚本\trae-backend.bat"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "正在更新: $file" -ForegroundColor Green
        $content = Get-Content $file -Encoding UTF8
        $content = $content -replace 'global-rules', '全局规则'
        $content = $content -replace 'project-rules', '项目规则'
        Set-Content $file $content -Encoding UTF8
        Write-Host "完成: $file" -ForegroundColor Blue
    } else {
        Write-Host "文件不存在: $file" -ForegroundColor Red
    }
}

Write-Host "所有脚本更新完成！" -ForegroundColor Yellow
