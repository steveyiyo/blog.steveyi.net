#!/bin/bash

DIRECTORY=/Users/steveyiyo/Documents/GitHub/blog.steveyi.net/content
AUTHOR_LINE='categories: ""'

find "$DIRECTORY" -type f | while read -r file; do
    if ! grep -q "categories:" "$file"; then
        # 使用 awk 在 title 之後添加 author
        awk -v categories="$AUTHOR_LINE" '/title: /{print; print categories; next}1' "$file" > temp_file
        mv temp_file "$file"
    fi
done
