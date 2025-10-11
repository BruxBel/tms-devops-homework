#!/bin/bash

# Для .log файлов
for file in *.log; do
    if [ -f "$file" ]; then
        timestamp=$(date +"%Y%m%d_%H%M%S")
        mv "$file" "${file%.log}_${timestamp}.log"
    fi
done

# Для .py файлов
if git rev-parse --git-dir > /dev/null 2>&1; then
    # Если есть незакоммиченные изменения, добавляем "dirty"
    if git diff-index --quiet HEAD --; then
        commit_hash=$(git rev-parse --short HEAD)
    else
        commit_hash=$(git rev-parse --short HEAD)_dirty
    fi
    
    for file in *.py; do
        if [ -f "$file" ]; then
            mv "$file" "${file%.py}_${commit_hash}.py"
        fi
    done
fi
