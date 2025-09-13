#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Использование: $0 <имя_файла> <новое_расширение>"
    echo "Пример: $0 document.txt pdf"
    exit 1
fi

filename="$1"
new_extension="$2"

new_extension="${new_extension#.}"

base_name="${filename%.*}"

current_extension="${filename##*.}"

# Есть ли расширение в исходном имени
if [ "$base_name" = "$filename" ]; then
    new_filename="${filename}.${new_extension}"
    echo "Исходный файл не имел расширения"
    echo "Новое имя файла: $new_filename"
else
    new_filename="${base_name}.${new_extension}"
    echo "Заменено расширение .$current_extension на .$new_extension"
    echo "Новое имя файла: $new_filename"
fi