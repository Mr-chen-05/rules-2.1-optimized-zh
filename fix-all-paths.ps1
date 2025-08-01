# 批量修复所有路径引用
Write-Host "开始批量修复路径引用..." -ForegroundColor Yellow

# 需要修复的脚本文件
$scriptFiles = @(
    "安装脚本\cursor-backend.bat",
    "安装脚本\trae-backend.bat"
)

# 需要修复的文档文件
$docFiles = @(
    "项目说明.md",
    "使用指南.md", 
    "命令参考.md",
    "安装脚本\INSTALL-GUIDE.md"
)

# 路径映射
$pathMappings = @{
    'install-scripts' = '安装脚本'
    'project-rules' = '项目规则'
    'global-rules' = '全局规则'
    'docs' = '文档'
    'tutorials' = '教程'
    'enterprise-test-reports' = '企业测试报告'
    'README.md' = '项目说明.md'
    'USAGE.md' = '使用指南.md'
    'COMMANDS-REFERENCE.md' = '命令参考.md'
}

# 修复脚本文件
Write-Host "修复脚本文件..." -ForegroundColor Green
foreach ($file in $scriptFiles) {
    if (Test-Path $file) {
        Write-Host "  修复: $file" -ForegroundColor Cyan
        $content = Get-Content $file -Encoding UTF8
        $content = $content -replace 'global-rules', '全局规则'
        $content = $content -replace 'project-rules', '项目规则'
        Set-Content $file $content -Encoding UTF8
        Write-Host "  完成: $file" -ForegroundColor Green
    }
}

# 修复文档文件
Write-Host "修复文档文件..." -ForegroundColor Green
foreach ($file in $docFiles) {
    if (Test-Path $file) {
        Write-Host "  修复: $file" -ForegroundColor Cyan
        $content = Get-Content $file -Encoding UTF8
        
        # 应用所有路径映射
        foreach ($oldPath in $pathMappings.Keys) {
            $newPath = $pathMappings[$oldPath]
            $content = $content -replace [regex]::Escape($oldPath), $newPath
        }
        
        Set-Content $file $content -Encoding UTF8
        Write-Host "  完成: $file" -ForegroundColor Green
    }
}

Write-Host "所有路径修复完成！" -ForegroundColor Yellow
