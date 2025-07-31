# 🔧 MCP Tools Setup Guide - MCP工具配置指南

Model Context Protocol (MCP) 工具的完整安装、配置和管理指南。

## 📖 概述

MCP (Model Context Protocol) 是连接AI助手与外部工具的标准协议。本指南将手把手教你安装和配置5个核心MCP工具。

**🎯 适合人群：**
- ✅ **AI开发者** - 想要扩展AI助手能力
- ✅ **完全新手** - 从未接触过MCP工具
- ✅ **团队管理者** - 需要为团队配置统一的工具链

**📚 你将学会：**
- 🔧 如何安装和配置Node.js环境
- 📦 如何安装5个核心MCP工具
- ⚙️ 如何配置AI工具集成
- 🤖 如何使用智能反馈机制

**⏱️ 预计时间：** 30-45分钟

## 📦 核心MCP工具列表

### 🛠️ 必需的5个工具
1. **@modelcontextprotocol/server-filesystem** - 文件系统操作
2. **@modelcontextprotocol/server-memory** - 记忆管理
3. **@modelcontextprotocol/server-github** - GitHub集成
4. **@modelcontextprotocol/server-everything** - 通用工具集
5. **mcp-feedback-enhanced** - 智能反馈机制

## 🚀 安装流程

### 第一步：环境检查
```bash
# 检查Node.js版本 (需要 v16.0.0+)
node --version

# 检查npm版本
npm --version

# 检查系统内存 (推荐 8GB+)
# Windows: wmic computersystem get TotalPhysicalMemory
# macOS/Linux: free -h
```

### 第二步：创建MCP目录
```bash
# 创建MCP工具目录
mkdir C:\MCP-Tools  # Windows
mkdir ~/MCP-Tools   # macOS/Linux

# 进入目录
cd C:\MCP-Tools     # Windows
cd ~/MCP-Tools      # macOS/Linux
```

### 第三步：安装核心工具
```bash
# 安装文件系统工具
npm install -g @modelcontextprotocol/server-filesystem

# 安装记忆管理工具
npm install -g @modelcontextprotocol/server-memory

# 安装GitHub集成工具
npm install -g @modelcontextprotocol/server-github

# 安装通用工具集
npm install -g @modelcontextprotocol/server-everything

# 安装智能反馈工具 (Python包，使用uv安装)
pip install uv
# mcp-feedback-enhanced 通过 uvx 运行，无需预安装
```

### 第四步：验证安装
```bash
# 验证Node.js工具安装
npm list -g --depth=0 | grep modelcontextprotocol

# 验证Python工具安装
uvx mcp-feedback-enhanced@latest version
```

## ⚙️ 配置文件生成

### 创建配置文件
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-filesystem", "C:\\你的项目目录"],
      "env": {}
    },
    "memory": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-memory"],
      "env": {}
    },
    "github": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "你的GitHub Token"
      }
    },
    "everything": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-everything"],
      "env": {}
    },
    "feedback": {
      "command": "uvx",
      "args": ["mcp-feedback-enhanced@latest"],
      "env": {
        "MCP_WEB_PORT": "8765"
      }
    }
  }
}
```

## 🤖 AI工具集成

### Augment集成
1. 打开Augment设置
2. 点击"Import MCP Config"
3. 选择配置文件
4. 确认导入成功

### Cursor集成
1. 复制配置到项目的.cursor/目录
2. Cursor自动识别并应用

### Claude Code集成
1. 将配置添加到CLAUDE.md文件
2. 或使用@import语法引用

### Trae AI集成
1. 复制配置到.trae/目录
2. 重启Trae AI应用配置

## ✅ 验证清单

### 安装检查
- [ ] Node.js版本 v16.0.0+
- [ ] 所有5个MCP工具已安装
- [ ] 配置文件已创建
- [ ] 项目路径已正确设置
- [ ] GitHub Token已配置

### 集成检查
- [ ] AI工具中配置已导入
- [ ] MCP工具可正常调用
- [ ] 文件操作权限正确
- [ ] GitHub集成工作正常
- [ ] 反馈机制响应正常

## 🎯 使用命令

安装完成后，你可以在AI工具中使用这些命令：

- `/mcp-setup` - 交互式MCP配置
- `/mcp-check` - 验证MCP工具状态
- `/mcp-install` - 安装MCP工具
- `/mcp-config` - 生成配置文件

## � 一键自动配置脚本

### Windows PowerShell 自动配置脚本

创建 `setup-mcp-tools.ps1` 脚本：

```powershell
# MCP Tools 一键配置脚本
Write-Host "🔧 MCP Tools 自动配置开始..." -ForegroundColor Green

# 检查环境
$envOk = $true

# 检查Node.js
if (!(Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ 请先安装Node.js: https://nodejs.org" -ForegroundColor Red
    $envOk = $false
} else {
    $nodeVersion = node --version
    Write-Host "✅ Node.js版本: $nodeVersion" -ForegroundColor Green
}

# 检查npm
if (!(Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host "❌ npm未找到，请重新安装Node.js" -ForegroundColor Red
    $envOk = $false
} else {
    $npmVersion = npm --version
    Write-Host "✅ npm版本: $npmVersion" -ForegroundColor Green
}

if (!$envOk) {
    Write-Host "❌ 环境检查失败，请先安装必需软件" -ForegroundColor Red
    exit 1
}

# 创建MCP工具目录
$mcpDir = "C:\MCP-Tools"
if (!(Test-Path $mcpDir)) {
    New-Item -ItemType Directory -Path $mcpDir
    Write-Host "✅ 创建MCP工具目录: $mcpDir" -ForegroundColor Green
} else {
    Write-Host "📁 MCP工具目录已存在: $mcpDir" -ForegroundColor Yellow
}

# 进入目录并安装工具
Set-Location $mcpDir
Write-Host "📦 开始安装MCP工具..." -ForegroundColor Blue

# 初始化项目
if (!(Test-Path "package.json")) {
    npm init -y | Out-Null
    Write-Host "✅ 初始化npm项目" -ForegroundColor Green
}

# 安装核心MCP工具 (Node.js包)
$nodeTools = @(
    "@modelcontextprotocol/server-filesystem",
    "@modelcontextprotocol/server-memory",
    "@modelcontextprotocol/server-github",
    "@modelcontextprotocol/server-everything",
    "@modelcontextprotocol/sdk"
)

foreach ($tool in $nodeTools) {
    Write-Host "📦 安装 $tool..." -ForegroundColor Blue
    npm install $tool
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ $tool 安装成功" -ForegroundColor Green
    } else {
        Write-Host "❌ $tool 安装失败" -ForegroundColor Red
    }
}

# 安装Python MCP工具
Write-Host "📦 安装 mcp-feedback-enhanced (Python包)..." -ForegroundColor Blue
pip install uv
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ uv 安装成功" -ForegroundColor Green
    Write-Host "📝 mcp-feedback-enhanced 将通过 uvx 自动运行" -ForegroundColor Yellow
} else {
    Write-Host "❌ uv 安装失败" -ForegroundColor Red
}

# 创建配置文件模板
$configTemplate = @"
{
  "mcpServers": {
    "filesystem": {
      "command": "node",
      "args": [
        "$($mcpDir.Replace('\', '\\'))\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "C:\\your-projects"
      ],
      "env": {}
    },
    "memory": {
      "command": "node",
      "args": [
        "$($mcpDir.Replace('\', '\\'))\\node_modules\\@modelcontextprotocol\\server-memory\\dist\\index.js"
      ],
      "env": {}
    },
    "github": {
      "command": "node",
      "args": [
        "$($mcpDir.Replace('\', '\\'))\\node_modules\\@modelcontextprotocol\\server-github\\dist\\index.js"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
      }
    },
    "everything": {
      "command": "node",
      "args": [
        "$($mcpDir.Replace('\', '\\'))\\node_modules\\@modelcontextprotocol\\server-everything\\dist\\index.js"
      ],
      "env": {}
    },
    "mcp-feedback-enhanced": {
      "command": "uvx",
      "args": [
        "mcp-feedback-enhanced@latest"
      ],
      "env": {
        "MCP_WEB_PORT": "8765",
        "MCP_DESKTOP_MODE": "false"
      }
    }
  }
}
"@

$configPath = Join-Path $mcpDir "mcp-config.json"
$configTemplate | Out-File -FilePath $configPath -Encoding UTF8
Write-Host "✅ 配置文件模板已创建: $configPath" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 MCP Tools 安装完成!" -ForegroundColor Green
Write-Host "📝 接下来请手动修改配置文件:" -ForegroundColor Yellow
Write-Host "   1. 将 'C:\\your-projects' 改为你的实际项目路径" -ForegroundColor Yellow
Write-Host "   2. 将 'your_github_token_here' 改为你的GitHub Token" -ForegroundColor Yellow
Write-Host "   3. 在AI工具中导入配置文件: $configPath" -ForegroundColor Yellow
```

### 使用自动配置脚本

**步骤1：创建脚本文件**
1. 在桌面右键 → 新建 → 文本文档
2. 将文件名改为 `setup-mcp-tools.ps1`
3. 复制上面的脚本内容到文件中
4. 保存文件

**步骤2：运行脚本**
1. 按 `Win + X`，选择"Windows PowerShell (管理员)"
2. 执行以下命令：
```powershell
cd Desktop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup-mcp-tools.ps1
```

**步骤3：修改配置文件**
脚本运行完成后，必须手动修改 `C:\MCP-Tools\mcp-config.json`：
- 将 `"C:\\your-projects"` 改为你的实际项目路径
- 将 `"your_github_token_here"` 改为你的GitHub Token

## �🔧 故障排除

### 常见问题详解

#### 问题1：Node.js版本过低
**错误信息**：`node: command not found` 或版本低于v16.0.0
**解决方案**：
```bash
# 检查当前版本
node --version

# 如果版本过低，访问 https://nodejs.org 下载最新LTS版本
# 或使用NVM管理多个版本：
nvm install 18.19.0
nvm use 18.19.0
```

#### 问题2：权限问题
**错误信息**：`EACCES: permission denied`
**解决方案**：
```bash
# Windows: 以管理员身份运行PowerShell
# macOS/Linux: 使用sudo
sudo npm install -g @modelcontextprotocol/sdk
```

#### 问题3：网络问题
**错误信息**：`network timeout` 或 `ETIMEDOUT`
**解决方案**：
```bash
# 切换到国内镜像源
npm config set registry https://registry.npmmirror.com

# 或使用小满zs工具包
npm i xmzs -g
mmp  # 选择淘宝镜像
```

#### 问题4：路径问题
**错误信息**：`cannot find module` 或路径相关错误
**解决方案**：
- 确保路径中没有中文字符
- 使用双反斜杠：`"C:\\MCP-Tools\\..."`
- 或使用正斜杠：`"C:/MCP-Tools/..."`

#### 问题5：JSON格式错误
**错误信息**：`Unexpected token` 或 `JSON parse error`
**解决方案**：
- 检查所有括号是否匹配
- 确保每个配置项后有逗号（最后一项除外）
- 使用在线JSON验证器检查格式

### 性能优化建议

#### Node.js内存优化
```bash
# 设置Node.js内存限制
export NODE_OPTIONS="--max-old-space-size=4096"  # Linux/macOS
set NODE_OPTIONS=--max-old-space-size=4096        # Windows
```

#### MCP工具缓存优化
```bash
# 定期清理npm缓存
npm cache clean --force

# 设置缓存目录
npm config set cache "C:\npm-cache"
```

### 获取帮助
- 📚 查看详细教程：[前端指南](../tutorials/frontend-rules-2.1-使用指南.md)
- 📚 查看详细教程：[后端指南](../tutorials/backend-rules-2.1-使用指南.md)
- 🚀 使用自动安装：[安装脚本](../install-scripts/INSTALL-GUIDE.md)
