#!/bin/bash

# Проверка наличия аргумента
if [ $# -eq 0 ]; then
    echo "Ошибка: Укажите каталог в качестве аргумента"
    echo "Использование: $0 <каталог>"
    exit 1
fi

directory="$1"

# Проверка существования каталога
if [ ! -d "$directory" ]; then
    echo "Ошибка: Каталог '$directory' не существует!"
    exit 1
fi

echo "Размеры и права доступа для файлов в каталоге: $directory"
echo "=========================================================="

# Рекурсивный поиск файлов с использованием find и обработка в цикле for
find "$directory" -type f | while read file; do
    # Получаем размер файла
    size=$(stat -c%s "$file" 2>/dev/null)
    
    # Получаем права доступа
    permissions=$(stat -c%A "$file" 2>/dev/null)
    
    # Выводим информацию
    echo "Файл: $file"
    echo "Размер: $size байт"
    echo "Права: $permissions"
    echo "---"
done
