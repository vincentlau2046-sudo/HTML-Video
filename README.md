# HTML-Video 技能

将技术资料（Markdown/文本）和HTML幻灯片转换为专业汇报视频的技能。

## 安装

### 系统依赖
```bash
# Ubuntu/Debian
sudo apt install ffmpeg wkhtmltopdf

# CentOS/RHEL  
sudo yum install ffmpeg wkhtmltopdf

# macOS
brew install ffmpeg wkhtmltopdf

# Windows (WSL2)
sudo apt install ffmpeg wkhtmltopdf
```

### Python依赖
```bash
pip install edge-tts playwright
playwright install chromium
```

### 全局安装
```bash
# 将技能目录添加到PATH
export PATH="$PATH:/home/Vincent/.openclaw/skills/html-video"

# 或者创建符号链接
sudo ln -s /home/Vincent/.openclaw/skills/html-video/html_video.py /usr/local/bin/html-video
sudo chmod +x /usr/local/bin/html-video
```

## 使用方法

### 基本用法
```bash
html-video --html-file "presentation.html" \
           --content-file "technical_analysis.md" \
           --output-dir "./output/my_presentation"
```

### 高级选项
```bash
html-video --html-file "slides.html" \
           --content-file "deep_dive.md" \
           --output-dir "./output/project" \
           --resolution "1080p" \
           --voice "zh-CN-YunxiNeural" \
           --speed "+25%"
```

### 参数说明
| 参数 | 必需 | 默认值 | 说明 |
|------|------|--------|------|
| `--html-file` | ✅ | - | HTML幻灯片文件路径 |
| `--content-file` | ✅ | - | 技术资料文件路径 |
| `--output-dir` | ✅ | - | 输出目录路径 |
| `--resolution` | ❌ | `1080p` | 视频分辨率 (`720p`/`1080p`/`4k`) |
| `--voice` | ❌ | `zh-CN-XiaoxiaoNeural` | TTS音色 |
| `--speed` | ❌ | `+25%` | 语速调节 |

## 支持的HTML结构

### 标准幻灯片结构
```html
<div class="slide" data-slide="1">
    <h2>标题</h2>
    <p>内容...</p>
</div>
<div class="slide" data-slide="2">
    <h2>标题</h2>
    <p>内容...</p>
</div>
```

### Reveal.js兼容结构
```html
<section>
    <h2>标题</h2>
    <p>内容...</p>
</section>
<section>
    <h2>标题</h2>
    <p>内容...</p>
</section>
```

### 自动分割模式
如果HTML不包含标准结构，技能会尝试按`<h1>`/`<h2>`标签自动分割内容。

## 输出示例

### 成功输出
```
✅ HTML-Video处理完成!
📁 输出目录: ./output/my_presentation
🎥 视频文件: ./output/my_presentation/video/my_presentation_Complete.mp4
```

### 目录结构
```
my_presentation/
├── my_presentation.md              # 原始技术资料备份
├── README.md                      # 输出说明文件
└── video/
    ├── my_presentation_Complete.mp4     # 完整汇报视频
    ├── slices/                    # 分页讲稿
    ├── screenshots/               # 幻灯片截图
    ├── audio/                     # 分页音频
    └── temp_videos/               # 单页视频
```

## 故障排除

### 常见问题

#### 1. 所有幻灯片显示相同内容
**原因**: HTML结构不符合要求，或截图工具未正确处理JavaScript
**解决方案**: 
- 确保HTML包含独立的幻灯片结构
- 使用静态HTML而非依赖JavaScript的动态内容
- 检查CSS样式是否正确应用

#### 2. Edge TTS无法生成音频
**原因**: 网络连接问题或音色不可用
**解决方案**:
```bash
# 检查可用音色
edge-tts --list-voices

# 使用备用音色
html-video --voice "zh-CN-YunxiNeural" ...
```

#### 3. wkhtmltoimage截图失败
**原因**: 复杂CSS或字体问题
**解决方案**:
- 简化HTML中的CSS样式
- 确保系统安装了所需字体
- 使用Playwright作为备选方案

### 调试模式
```bash
# 启用详细日志
python html_video.py --html-file ... --content-file ... --output-dir ... --debug
```

## 质量保证

### ✅ 通过标准
- 每页幻灯片内容正确显示（无重复）
- 音频与对应幻灯片内容匹配
- 视频流畅播放，无卡顿
- 音频清晰，语速适中
- 输出文件完整，格式标准

### ❌ 禁止事项
- **绝对禁止**所有幻灯片显示相同内容
- **绝对禁止**音频与幻灯片内容不匹配
- **绝对禁止**跳过内容验证直接生成
- **绝对禁止**输出无法播放的视频文件

## 版本信息
- **当前版本**: 1.0.0
- **最后更新**: 2026-04-01
- **作者**: Vincent
- **许可证**: MIT

## 贡献指南

欢迎提交Issue和Pull Request！主要改进方向：
- 支持更多HTML幻灯片框架（Reveal.js, Impress.js等）
- 添加更多TTS引擎支持（Azure, Google Cloud等）
- 优化性能和内存使用
- 增强错误处理和降级策略