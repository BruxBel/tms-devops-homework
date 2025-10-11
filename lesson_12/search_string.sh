#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Использование: $0 <строка> <каталог>"
    exit 1
fi

search_string="$1"
directory="$2"

echo "Поиск: '$search_string' в '$directory'"
echo "======================================"

find "$directory" -type f 2>&1 | while read line; do
    # Проверяем, это путь к файлу или ошибка
    if [[ "$line" == *"Permission denied"* ]] || [[ "$line" == *"find:"* ]]; then
        # Это сообщение об ошибке
        echo "ОШИБКА ДОСТУПА: $line"
    elif [ -r "$line" ] && [ -f "$line" ]; then
        # Это доступный файл - ищем строку
        if grep -q "$search_string" "$line" 2>/dev/null; then
            size=$(stat -c%s "$line" 2>/dev/null || echo "неизвестно")
            echo "ФАЙЛ: $line"
            echo "РАЗМЕР: $size байт"
            echo "---"
        fi
    fi
done
