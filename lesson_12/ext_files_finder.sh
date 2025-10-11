#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 3 ]; then
    echo "Использование: $0 <выходной_файл> <каталог> <расширение>"
    echo "Пример: $0 result.txt /home/user txt"
    exit 1
fi

output_file="$1"
directory="$2"
extension="$3"

# Проверка существования каталога
if [ ! -d "$directory" ]; then
    echo "Ошибка: Каталог '$directory' не существует!"
    exit 1
fi

# Поиск файлов и запись в файл
echo "Поиск файлов с расширением .$extension в каталоге $directory"
find "$directory" -type f -name "*.$extension" > "$output_file"
echo "Результат сохранен в: $output_file"
