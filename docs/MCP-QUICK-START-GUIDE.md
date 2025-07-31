# 🚀 MCP工具快速入门指南 - 5分钟上手

> **🎯 目标**: 让完全新手在5分钟内成功配置并使用MCP工具  
> **📱 适用**: Augment、Cursor、Claude Code、Trae AI等AI开发工具  
> **⏱️ 预计时间**: 5-10分钟  

## 📖 什么是MCP？

**MCP (Model Context Protocol)** 是连接AI助手与外部工具的标准协议，让AI能够：
- 📁 操作文件系统（读写文件、创建目录）
- 🧠 管理记忆（保存和检索信息）
- 🐙 集成GitHub（创建仓库、提交代码）
- 💬 获取用户反馈（交互式确认和输入）
- 🔧 执行各种工具命令

## 🎯 一键配置（推荐方式）

### 步骤1：检查环境
```powershell
# 检查Node.js（必需）
node --version
# 应该显示 v16.0.0 或更高版本

# 检查Python（必需）
python --version
# 应该显示 Python 3.8 或更高版本
```

**如果没有安装**：
- Node.js: 访问 https://nodejs.org 下载LTS版本
- Python: 访问 https://python.org 下载最新版本

### 步骤2：安装uv工具
```powershell
pip install uv
```

### 步骤3：复制配置文件
选择适合你的AI工具的配置：

#### 🔥 完整配置（推荐 - 支持所有功能）
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-filesystem", "C:\\your-projects"],
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
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
      }
    },
    "everything": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-everything"],
      "env": {}
    },
    "mcp-feedback-enhanced": {
      "command": "uvx",
      "args": ["mcp-feedback-enhanced@latest"],
      "timeout": 600,
      "env": {
        "MCP_WEB_PORT": "8765",
        "MCP_DESKTOP_MODE": "false",
        "MCP_DEBUG": "false"
      },
      "autoApprove": ["interactive_feedback"]
    }
  }
}
```

#### 🖥️ 桌面应用配置（推荐桌面用户）
```json
{
  "mcpServers": {
    "mcp-feedback-enhanced": {
      "command": "uvx",
      "args": ["mcp-feedback-enhanced@latest"],
      "timeout": 600,
      "env": {
        "MCP_DESKTOP_MODE": "true",
        "MCP_WEB_PORT": "8765",
        "MCP_DEBUG": "false"
      },
      "autoApprove": ["interactive_feedback"]
    }
  }
}
```

#### 🌐 Web界面配置（推荐远程用户）
```json
{
  "mcpServers": {
    "mcp-feedback-enhanced": {
      "command": "uvx",
      "args": ["mcp-feedback-enhanced@latest"],
      "timeout": 600,
      "env": {
        "MCP_WEB_HOST": "0.0.0.0",
        "MCP_WEB_PORT": "8765",
        "MCP_DESKTOP_MODE": "false",
        "MCP_DEBUG": "false"
      },
      "autoApprove": ["interactive_feedback"]
    }
  }
}
```

### 步骤4：配置你的AI工具

#### 🎨 Augment配置
1. 打开Augment设置
2. 找到"MCP Servers"或"工具配置"
3. 粘贴上面的JSON配置
4. 修改 `C:\\your-projects` 为你的实际项目路径
5. 保存并重启Augment

#### 🖱️ Cursor配置
1. 按 `Ctrl+Shift+P` 打开命令面板
2. 输入"Preferences: Open Settings (JSON)"
3. 在配置文件中添加上面的JSON配置
4. 修改 `C:\\your-projects` 为你的实际项目路径
5. 保存并重启Cursor

#### 🤖 Claude Code配置
1. 在项目根目录创建 `.claude_config` 文件
2. 粘贴上面的JSON配置
3. 修改 `C:\\your-projects` 为你的实际项目路径
4. 重启Claude Code

#### 🎯 Trae AI配置
1. 打开Trae AI设置
2. 找到"MCP配置"选项
3. 粘贴上面的JSON配置
4. 修改 `C:\\your-projects` 为你的实际项目路径
5. 保存并重启Trae AI

### 步骤5：测试配置
在你的AI工具中输入：
```
请帮我测试MCP工具是否正常工作
```

如果配置成功，AI会：
1. 🖥️ 自动打开桌面应用或浏览器界面
2. 💬 显示反馈界面让你确认
3. ✅ 返回确认信息

## 🔧 高级配置选项

### 环境变量说明

| 变量名 | 作用 | 可选值 | 默认值 |
|--------|------|--------|--------|
| `MCP_DESKTOP_MODE` | 启用桌面应用 | `true`/`false` | `false` |
| `MCP_WEB_HOST` | Web界面绑定地址 | IP地址 | `127.0.0.1` |
| `MCP_WEB_PORT` | Web界面端口 | 1024-65535 | `8765` |
| `MCP_DEBUG` | 调试模式 | `true`/`false` | `false` |
| `MCP_LANGUAGE` | 强制界面语言 | `zh-CN`/`zh-TW`/`en` | 自动检测 |

### 特殊环境配置

#### 🌐 SSH远程开发
```json
{
  "env": {
    "MCP_WEB_HOST": "0.0.0.0",
    "MCP_WEB_PORT": "8765"
  }
}
```
然后在本地浏览器访问：`http://远程服务器IP:8765`

#### 🐧 WSL环境
```json
{
  "env": {
    "MCP_WEB_HOST": "0.0.0.0",
    "MCP_WEB_PORT": "8765",
    "MCP_DESKTOP_MODE": "false"
  }
}
```

#### 🖥️ 多屏幕环境
```json
{
  "env": {
    "MCP_DESKTOP_MODE": "true",
    "MCP_WEB_PORT": "8765"
  }
}
```

## 🎯 GitHub集成配置

### 获取GitHub Token
1. 访问 https://github.com/settings/tokens
2. 点击"Generate new token (classic)"
3. 选择权限：`repo`, `user`, `workflow`
4. 复制生成的token
5. 替换配置中的 `your_github_token_here`

### GitHub配置示例
```json
{
  "github": {
    "command": "npx",
    "args": ["@modelcontextprotocol/server-github"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
    }
  }
}
```

## ✅ 验证清单

### 安装验证
- [ ] Node.js版本 ≥ v16.0.0
- [ ] Python版本 ≥ 3.8
- [ ] uv工具已安装
- [ ] 配置文件已添加到AI工具
- [ ] 项目路径已正确设置

### 功能验证
- [ ] AI工具显示MCP连接成功
- [ ] 反馈界面能正常打开
- [ ] 文件操作功能正常
- [ ] GitHub集成工作正常（如果配置）

## 🐛 常见问题解决

### Q: 反馈界面打不开？
**A**: 检查端口是否被占用
```powershell
netstat -an | findstr :8765
```
如果被占用，修改配置中的端口号。

### Q: SSH环境下无法访问？
**A**: 设置 `MCP_WEB_HOST` 为 `0.0.0.0`，并确保防火墙允许端口访问。

### Q: GitHub功能不工作？
**A**: 检查Token权限，确保包含 `repo` 权限。

### Q: 中文显示乱码？
**A**: 添加语言配置：
```json
{
  "env": {
    "MCP_LANGUAGE": "zh-CN"
  }
}
```

## 🎉 成功！你现在可以：

- 💬 让AI获取你的实时反馈
- 📁 让AI操作文件和目录
- 🧠 让AI记住重要信息
- 🐙 让AI管理GitHub仓库
- 🔧 使用各种强大的工具功能

**下一步**: 尝试对AI说"请帮我创建一个新项目"，体验MCP的强大功能！
