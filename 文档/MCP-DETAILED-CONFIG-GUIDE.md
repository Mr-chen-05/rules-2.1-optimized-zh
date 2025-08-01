# 📋 MCP工具详细配置指南

> **🎯 目标**：手把手教你正确配置MCP工具，避免常见错误，确保100%可用

## 📖 概述

本指南专门解决MCP配置中的常见问题，提供详细的配置步骤和故障排除方案。

**🎯 适合人群：**
- ✅ **配置失败用户** - MCP工具无法正常工作
- ✅ **完全新手** - 第一次配置MCP工具
- ✅ **多项目用户** - 需要管理多个项目的配置
- ✅ **高级用户** - 需要自定义配置的用户

## 🚨 重要提醒

**配置文件是模板，必须修改！**
- ❌ 直接复制粘贴模板 → 100%失败
- ✅ 根据实际情况修改 → 100%成功

## 📁 第一步：确定你的安装路径

### **1.1 找到MCP工具安装路径**

**方法1：检查安装目录**
```bash
# 如果你按照教程安装，通常在：
C:\MCP-Tools\

# 检查是否存在以下文件夹：
C:\MCP-Tools\node_modules\@modelcontextprotocol\
```

**方法2：使用命令查找**
```bash
# 在命令行中执行
where node
# 查看Node.js安装路径，MCP工具通常在附近
```

**方法3：全局搜索**
```bash
# 搜索MCP相关文件夹
dir /s /b C:\ | findstr "modelcontextprotocol"
```

### **1.2 找到你的项目路径**

**方法1：文件资源管理器**
1. 打开你的项目文件夹
2. 点击地址栏（显示路径的地方）
3. 复制完整路径，如：`D:\前端\TS`

**方法2：右键菜单**
1. 在项目文件夹上右键
2. 选择"属性"
3. 在"位置"中查看路径

**方法3：命令行**
```bash
# 进入项目目录后执行
cd /d D:\前端\TS
echo %cd%  # 显示当前路径
```

## 📝 第二步：创建配置文件

### **2.1 单项目配置（推荐新手）**

**适用场景：** 只有一个主要项目需要AI助手

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "D:\\我的项目"
      ],
      "env": {}
    },
    "memory": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-memory\\dist\\index.js"
      ],
      "env": {}
    },
    "github": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-github\\dist\\index.js"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
      }
    },
    "everything": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-everything\\dist\\index.js"
      ],
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

**🔧 必须修改的地方：**
1. `C:\\MCP-Tools` → 你的MCP安装路径
2. `D:\\我的项目` → 你的项目路径
3. `ghp_xxxxxxxxxxxxxxxxxxxx` → 你的GitHub Token

### **2.2 多项目配置（推荐高级用户）**

**适用场景：** 有多个项目需要分别管理

```json
{
  "mcpServers": {
    "前端项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "D:\\前端\\Vue项目"
      ],
      "env": {}
    },
    "后端项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "E:\\后端\\SpringBoot"
      ],
      "env": {}
    },
    "学习项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "C:\\Users\\用户名\\Desktop\\学习"
      ],
      "env": {}
    },
    "memory": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-memory\\dist\\index.js"
      ],
      "env": {}
    },
    "github": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-github\\dist\\index.js"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
      }
    },
    "mcp-feedback-enhanced": {
      "command": "uvx",
      "args": ["mcp-feedback-enhanced@latest"],
      "timeout": 600,
      "env": {
        "MCP_WEB_PORT": "8765",
        "MCP_DESKTOP_MODE": "false"
      },
      "autoApprove": ["interactive_feedback"]
    }
  }
}
```

## 🔧 第三步：修改配置文件

### **3.1 修改步骤详解**

**步骤1：创建文件**
1. 在MCP工具目录下创建 `mcp-config.json`
2. 复制上面的模板内容

**步骤2：修改MCP工具路径**
```json
// 找到这样的行：
"C:\\MCP-Tools\\node_modules\\..."

// 替换为你的实际路径：
"D:\\MyMCP\\node_modules\\..."
```

**步骤3：修改项目路径**
```json
// 单项目：
"D:\\我的项目"

// 多项目：
"D:\\前端\\Vue项目"
"E:\\后端\\SpringBoot"
```

**步骤4：修改GitHub Token**
```json
// 替换这一行：
"GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"

// 改为：
"GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
```

### **3.2 路径格式规范**

**✅ 正确格式：**
```json
"C:\\Users\\张三\\Desktop\\项目"    // 双反斜杠
"D:/前端/Vue项目"                  // 正斜杠
"E:\\work\\frontend"              // 双反斜杠
```

**❌ 错误格式：**
```json
"C:\Users\张三\Desktop\项目"       // 单反斜杠（会出错）
"D:\前端\Vue项目"                  // 单反斜杠（会出错）
```

## ✅ 第四步：验证配置

### **4.1 配置检查清单**

**文件检查：**
- [ ] 文件名是 `mcp-config.json`
- [ ] 文件位置在MCP工具目录下
- [ ] JSON格式正确（括号、逗号完整）

**路径检查：**
- [ ] MCP工具路径存在且正确
- [ ] 项目路径存在且可访问
- [ ] 所有路径使用正确格式

**Token检查：**
- [ ] GitHub Token已替换
- [ ] Token格式正确（ghp_开头）
- [ ] Token权限包含repo、user、workflow

### **4.2 测试配置**

**方法1：启动AI工具**
1. 重启你的AI工具（Claude、Cursor等）
2. 查看是否能正常加载MCP工具
3. 测试文件读写功能

**方法2：检查日志**
1. 查看AI工具的错误日志
2. 确认没有MCP相关错误
3. 验证所有工具正常加载

## 🐛 第五步：常见问题解决

### **5.1 路径问题**

**问题：** `cannot find module` 或路径相关错误
**解决方案：**
- 确保路径中没有中文字符（如果可能）
- 使用双反斜杠：`"C:\\MCP-Tools\\..."`
- 或使用正斜杠：`"C:/MCP-Tools/..."`
- 检查路径是否真实存在

### **5.2 JSON格式错误**

**问题：** `Unexpected token` 或 `JSON parse error`
**解决方案：**
- 检查所有括号是否匹配
- 确保每个配置项后有逗号（最后一项除外）
- 使用在线JSON验证器检查格式
- 注意中文引号和英文引号的区别

### **5.3 GitHub Token问题**

**问题：** GitHub相关功能无法使用
**解决方案：**
- 重新生成GitHub Personal Access Token
- 确保Token权限包含：`repo`, `user`, `workflow`
- 检查Token格式（应该以ghp_开头）
- 确认Token没有过期

## 📚 附录：完整示例

### **A.1 前端开发者配置示例**
```json
{
  "mcpServers": {
    "vue项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "D:\\前端\\Vue3项目"
      ],
      "env": {}
    },
    "react项目": {
      "command": "node", 
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "D:\\前端\\React项目"
      ],
      "env": {}
    },
    "memory": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-memory\\dist\\index.js"
      ],
      "env": {}
    },
    "github": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-github\\dist\\index.js"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
      }
    },
    "mcp-feedback-enhanced": {
      "command": "uvx",
      "args": ["mcp-feedback-enhanced@latest"],
      "timeout": 600,
      "env": {
        "MCP_WEB_PORT": "8765",
        "MCP_DESKTOP_MODE": "false"
      },
      "autoApprove": ["interactive_feedback"]
    }
  }
}
```

### **A.2 后端开发者配置示例**
```json
{
  "mcpServers": {
    "java项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "E:\\Java\\SpringBoot项目"
      ],
      "env": {}
    },
    "python项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "E:\\Python\\FastAPI项目"
      ],
      "env": {}
    },
    "memory": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-memory\\dist\\index.js"
      ],
      "env": {}
    },
    "github": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-github\\dist\\index.js"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
      }
    },
    "mcp-feedback-enhanced": {
      "command": "uvx",
      "args": ["mcp-feedback-enhanced@latest"],
      "timeout": 600,
      "env": {
        "MCP_WEB_PORT": "8765",
        "MCP_DESKTOP_MODE": "false"
      },
      "autoApprove": ["interactive_feedback"]
    }
  }
}
```

---

**🎉 配置完成！** 现在你的MCP工具应该可以正常工作了。如果还有问题，请查看 [MCP故障排除指南](MCP-TROUBLESHOOTING-GUIDE.md)。
