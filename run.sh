#!/bin/bash

# 設定 Markdown 檔案所在的根目錄
root_directory="/Users/steveyiyo/Documents/GitHub/blog.steveyi.net/content"


# 遍歷所有 .md 檔案
find "$root_directory" -type f -name "*.md" | while read -r file; do
    # 只處理沒有引號的單一標籤
    sed -i.bak -E '/^tags: [^["]/{
        s/tags: ([^,]+)/tags: ["\1"]/;   # 將單一標籤轉換為列表格式
    }' "$file"
    echo "已修正檔案: $file"
    # 刪除備份文件
    rm "${file}.bak"
done

echo "腳本執行完畢。"
