#!/bin/bash

if [ $# -eq 0 ]; then
    text=$(cat)
else
    text="$1"
fi

echo "$text" | awk '{
    if (NF > 0) {
        result = ""  # начинаем с пустой строки
        prev = tolower($i)    # первое слово
        
        for (i = 2; i <= NF; i++) {
            current = tolower($i)
            # Сравниваем текущее слово с предыдущим
            if (current != prev) {
                if (result == "") {
                    result = $i      # первое слово без пробела
                } else {
                    result = result " " $i  # остальные слова с пробелом
                }
                prev = current
            }
        }
        print result
    }
}'
