#!/bin/bash

# HTML-Video 技能测试脚本

echo "🧪 测试HTML-Video技能..."

# 创建测试目录
TEST_DIR="/tmp/html-video-test"
mkdir -p "$TEST_DIR"

# 创建测试HTML文件
cat > "$TEST_DIR/test_slides.html" << 'EOF'
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>测试幻灯片</title>
    <style>
        .slide { padding: 20px; }
        h2 { color: #007acc; }
    </style>
</head>
<body>
    <div class="slide" data-slide="1">
        <h2>第一页：介绍</h2>
        <p>这是测试幻灯片的第一页。</p>
    </div>
    <div class="slide" data-slide="2">
        <h2>第二页：内容</h2>
        <p>这是测试幻灯片的第二页。</p>
    </div>
    <div class="slide" data-slide="3">
        <h2>第三页：总结</h2>
        <p>这是测试幻灯片的第三页。</p>
    </div>
</body>
</html>
EOF

# 创建测试技术资料
cat > "$TEST_DIR/test_content.md" << 'EOF'
# 测试技术分析

## 核心发现
- 这是一个测试文档
- 用于验证HTML-Video技能
- 包含三个主要部分

## 详细分析
第一部分介绍基本概念，第二部分深入技术细节，第三部分提供总结和建议。
EOF

# 运行HTML-Video
python3 html_video.py \
    --html-file "$TEST_DIR/test_slides.html" \
    --content-file "$TEST_DIR/test_content.md" \
    --output-dir "$TEST_DIR/output" \
    --resolution "720p"

# 检查输出
if [ -f "$TEST_DIR/output/video/test_slides_Complete.mp4" ]; then
    echo "✅ 测试成功！视频已生成。"
    echo "📁 输出位置: $TEST_DIR/output/"
else
    echo "❌ 测试失败！视频未生成。"
    exit 1
fi

# 清理测试文件（可选）
# rm -rf "$TEST_DIR"