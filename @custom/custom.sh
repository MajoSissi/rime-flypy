#!/bin/bash
# 上层rime目录
cd ..
# 当前目录（rime目录）
current_dir=$(pwd)
custom_dir="$current_dir/@custom"

# 删除 用户词典调频
# sed -i '/cold_word_drop/d' $current_dir/wanxiang.schema.yaml

# 删除 无效文件
rm -rf custom .github *.trime.yaml squirrel.yaml LICENSE CHANGELOG.md wanxiang_temp
# 复制所有 .custom.yaml 文件
echo "正在复制: .custom.yaml 文件..."
find "$custom_dir" -name "*.custom.yaml" -type f -exec cp -f {} "$current_dir" \;
# 自定义词汇
cp -f $custom_dir/custom_phrase.txt .
echo "自定义词汇: custom_phrase.txt"
# 移动 README.md .gitignore
cp -f $custom_dir/README.md .
cp -f $custom_dir/.gitignore .

echo "所有操作已完成!"
