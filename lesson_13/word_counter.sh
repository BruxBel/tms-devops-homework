#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Ошибка: Не передан текст для анализа"
    echo "Использование: $0 \"текст со словами\""
    exit 1
fi

text="$1"
word_count=$(echo "$text" | grep -o -E '[[:alpha:]]+(-[[:alpha:]]+)*' | wc -l)
echo "Количество слов: $word_count"
