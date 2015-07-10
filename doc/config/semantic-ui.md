本项目采用 Semantic UI 作为前端框架，具体的 JS 和 CSS 文件在 vendor/assets 中。

为保持 Semantic UI 与官方版本更新同步，需做以下操作：

#### 1. 更新 Semantic UI git 代码

```bash
git clone https://github.com/Semantic-Org/Semantic-UI.git
```

#### 2. 编辑 Semantic UI 设置

进入 Semantic UI 目录，将 `semantic.json.example` 重命名为 `semantic.json`，`src/theme.config.example` 重命名为 `theme.config`

编辑 `theme.config` ，在 /* Global */ 区域添加一行配置：

```
@importGoogleFonts : false;
```

#### 3. 构建 Semantic UI

回到 Semantic UI 主目录，使用命令

```bash
bower install
```

#### 4. 拷贝代码

生成的代码在 dist 文件夹下，将 semantic.js 复制到 follow-up-server/vendor/assets/javascripts，将 semantic.css 和 themes 文件夹复制到 follow-up-server/vendor/assets/stylesheets