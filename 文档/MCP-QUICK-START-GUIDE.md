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

### 步骤1：检查和配置环境

#### 🔍 环境检查
```powershell
# 检查Node.js（必需）
node --version
# 应该显示 v16.0.0 或更高版本

# 检查Python（必需）
python --version
# 应该显示 Python 3.8 或更高版本
```

#### 📦 Node.js 安装选项

**方式1：直接安装（推荐新手）**
- 🔗 **下载地址**：https://nodejs.org
- 📝 **选择版本**：点击左侧绿色按钮下载 LTS 版本

**方式2：使用 NVM 管理（推荐开发者）**
- ✅ **优点**：可以安装和切换多个 Node.js 版本
- 🎯 **适合人群**：需要在不同项目间切换 Node.js 版本的开发者

<details>
<summary>🚀 <strong>NVM 详细安装教程</strong>（点击展开）</summary>

**⚠️ 重要：安装 NVM 前必须先卸载已有 Node.js！**

**🗑️ 卸载已有 Node.js：**
1. **检查是否已安装**：
   ```bash
   node --version
   ```
   - ✅ 显示"不是内部或外部命令" = 没安装，可直接安装 NVM
   - ❌ 显示版本号 = 已安装，需要先卸载

2. **卸载步骤**：
   - 按`Win + R`，输入`appwiz.cpl`，按回车
   - 找到"Node.js" → 右键 → 卸载
   - 清理残留：删除 `C:\Users\%USERNAME%\AppData\Roaming\npm` 目录

**🔽 NVM 安装步骤：**
1. **下载**：访问 https://github.com/coreybutler/nvm-windows/releases
2. **安装**：右键以管理员身份运行 `nvm-setup.exe`
3. **验证**：打开新的命令提示符，输入 `nvm version`
4. **安装Node.js**：
   ```bash
   # 安装最新LTS版本
   nvm install 18.19.0
   nvm use 18.19.0

   # 验证安装
   node --version
   npm --version
   ```

**🎯 NVM 常用命令：**
```bash
nvm list              # 查看已安装版本
nvm list available    # 查看可安装版本
nvm install 18.19.0   # 安装指定版本
nvm use 18.19.0       # 切换到指定版本
```

</details>

#### 🚀 npm 镜像源配置（解决安装慢问题）

如果你在中国大陆，强烈建议配置npm镜像源以提高安装速度：

<details>
<summary>📦 <strong>npm镜像源配置教程</strong>（点击展开）</summary>

**方式1：使用淘宝镜像（推荐）**
```bash
# 设置淘宝镜像
npm config set registry https://registry.npmmirror.com

# 验证配置
npm config get registry
# 应该显示：https://registry.npmmirror.com
```

**方式2：使用cnpm（备选）**
```bash
# 安装cnpm
npm install -g cnpm --registry=https://registry.npmmirror.com

# 使用cnpm代替npm
cnpm install package-name
```

**方式3：临时使用镜像**
```bash
# 单次安装使用镜像
npm install package-name --registry=https://registry.npmmirror.com
```

**🔄 恢复官方源：**
```bash
npm config set registry https://registry.npmjs.org
```

**📊 镜像源速度测试：**
```bash
# 安装测试工具
npm install -g nrm

# 测试各镜像源速度
nrm test

# 切换到最快的源
nrm use taobao
```

</details>

#### 🐍 Python 环境配置
**如果没有安装Python**：
- 访问 https://python.org 下载最新版本
- 安装时勾选"Add Python to PATH"

### 步骤2：安装uv工具
```powershell
pip install uv
```

### 步骤3：复制配置文件
选择适合你的AI工具的配置：

#### 🔥 完整配置（推荐 - 支持所有功能）

**⚠️ 重要提醒：** 下面的配置文件是**模板**，你必须根据自己的实际情况修改，否则无法正常工作！

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "C:\\your-projects"
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
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
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

#### **🚨 配置文件中必须修改的内容：**

**🔧 必须修改的 3 个地方：**

**1. MCP工具安装路径（检查是否正确）**
```json
// 如果你的MCP工具不是安装在C:\MCP-Tools，需要修改所有路径：
"C:\\MCP-Tools\\node_modules\\..."

// 改为你的实际安装路径：
"D:\\MyMCP\\node_modules\\..."  // 示例：安装在D盘
```

**2. 项目路径（必改）**
```json
// 模板中的默认路径：
"C:\\your-projects"

// 你需要改为你的实际项目路径：
"D:\\前端\\Vue项目"           // 示例1：D盘Vue项目
"C:\\Users\\张三\\Desktop\\前端"  // 示例2：桌面前端项目
"E:\\workspace\\react-app"    // 示例3：React项目
```

**3. GitHub Token（必改）**
```json
// 模板中的占位符：
"GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"

// 你需要改为你的实际GitHub Token：
"GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
```

#### **📝 如何修改配置文件：**

**步骤 1：创建配置文件**
1. 在你的MCP工具安装目录下创建新文件（通常是 `C:\MCP-Tools`）
2. 文件名：`mcp-config.json`
3. 复制上面的模板内容到文件中

**步骤 2：修改MCP工具路径**
1. 找到所有包含 `C:\\MCP-Tools` 的行
2. 替换为你的实际MCP工具安装路径
3. 注意使用双反斜杠：`"D:\\MyMCP\\node_modules\\..."`

**步骤 3：修改项目路径**
1. 找到 `"C:\\your-projects"` 这一行
2. 替换为你的实际项目路径
3. 注意使用双反斜杠：`"D:\\前端\\项目"`

**步骤 4：修改 GitHub Token**
1. 找到 `"your_github_token_here"` 这一行
2. 替换为你的实际 GitHub Token
3. 保持双引号格式

**步骤 5：保存文件**
1. 按 `Ctrl + S` 保存
2. 确认文件名是 `mcp-config.json`

#### **✅ 配置完成检查清单：**
- [ ] MCP工具路径已改为实际安装路径
- [ ] 项目路径已改为实际项目路径
- [ ] GitHub Token 已替换为真实 Token
- [ ] 所有路径使用双反斜杠格式
- [ ] JSON 格式正确（逗号、括号完整）
- [ ] 文件已保存为 `mcp-config.json`

#### **📂 如何找到你的项目路径：**

**方法 1：文件资源管理器**
1. 打开你的项目文件夹
2. 点击地址栏（显示路径的地方）
3. 复制完整路径，如：`D:\前端\TS`

**方法 2：右键菜单**
1. 在项目文件夹上右键
2. 选择"属性"
3. 在"位置"中查看路径

**⚠️ 路径配置注意事项：**

**Windows 路径格式：**
- ✅ **正确**：`"D:\\前端\\TS"`（双反斜杠）
- ✅ **正确**：`"D:/前端/TS"`（正斜杠）
- ❌ **错误**：`"D:\前端\TS"`（单反斜杠会出错）

**路径示例：**
```json
// 桌面项目
"C:\\Users\\你的用户名\\Desktop\\我的项目"

// D盘项目
"D:\\开发\\前端项目"

// 工作项目
"E:\\work\\frontend"
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

#### **📁 多个项目配置（高级）：**

如果你有多个项目在不同文件夹，可以配置多个 filesystem：

```json
{
  "mcpServers": {
    "前端项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "D:\\前端项目"
      ],
      "env": {}
    },
    "后端项目": {
      "command": "node",
      "args": [
        "C:\\MCP-Tools\\node_modules\\@modelcontextprotocol\\server-filesystem\\dist\\index.js",
        "E:\\后端项目"
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
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
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

#### **🎯 命名规范和技巧：**

**✅ 好的命名：**
- `前端项目` - 中文描述，一目了然
- `vue-projects` - 英文描述，简洁明了
- `work-frontend` - 工作前端项目
- `study-backend` - 学习后端项目

**❌ 避免的命名：**
- `filesystem` - 太通用，不知道是什么项目
- `project1` - 数字命名，容易混淆
- `aaa` - 无意义命名

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

### 🔧 Node.js 和 npm 相关问题

#### Q: npm 安装速度很慢？
**A**: 切换到国内镜像源（推荐）
```bash
# 设置淘宝镜像
npm config set registry https://registry.npmmirror.com

# 验证配置
npm config get registry
```

#### Q: 提示"nvm 不是内部或外部命令"？
**A**: 环境变量配置问题
```bash
解决方案：
1. 重新打开命令提示符（关闭后重新打开）
2. 检查环境变量：
   - 按Win + R，输入sysdm.cpl
   - 点击"环境变量"
   - 在"系统变量"中找到Path
   - 确认包含：C:\nvm
```

#### Q: NVM 安装 Node.js 时提示权限错误？
**A**: 权限不足
```bash
解决方案：
1. 以管理员身份运行命令提示符
2. 或者重新以管理员身份安装NVM
```

#### Q: 切换 Node.js 版本后 npm 命令失效？
**A**: npm 需要重新安装
```bash
解决方案：
1. 重新安装npm：npm install -g npm
2. 或者重新安装Node.js：nvm install 18.19.0
```

### 🔌 MCP 工具相关问题

#### Q: 反馈界面打不开？
**A**: 检查端口是否被占用
```powershell
netstat -an | findstr :8765
```
如果被占用，修改配置中的端口号。

#### Q: SSH环境下无法访问？
**A**: 设置 `MCP_WEB_HOST` 为 `0.0.0.0`，并确保防火墙允许端口访问。

#### Q: GitHub功能不工作？
**A**: 检查Token权限，确保包含 `repo` 权限。

#### Q: 中文显示乱码？
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
