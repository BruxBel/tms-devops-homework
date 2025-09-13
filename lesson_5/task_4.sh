#!/bin/bash

# Проверка количества аргументов
if [ $# -lt 3 ] || [ $# -gt 4 ]; then
    echo "Использование: $0 <строка> <начало> <конец> [--delete]"
    echo "Примеры:"
    echo "  Выделение: $0 'Hello World' 2 7"
    echo "  Удаление:  $0 'Hello World' 2 7 --delete"
    exit 1
fi

string="$1"
start="$2"
end="$3"
delete_mode=false

# Проверка режима удаления
if [ $# -eq 4 ] && [ "$4" = "--delete" ]; then
    delete_mode=true
fi

# Проверка корректности границ
if ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$end" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: начало и конец должны быть числами"
    exit 1
fi

if [ "$start" -gt "$end" ]; then
    echo "Ошибка: начало не может быть больше конца"
    exit 1
fi

if [ "$start" -lt 1 ] || [ "$end" -gt "${#string}" ]; then
    echo "Ошибка: границы выходят за пределы строки"
    echo "Длина строки: ${#string}"
    exit 1
fi

# Выделение подстроки с помощью cut
if [ "$delete_mode" = true ]; then
    # Режим удаления:
    if [ $start -eq 1 ]; then
        # Удаление с начала
        result=$(echo "$string" | cut -c $((end + 1))-)
    elif [ $end -eq "${#string}" ]; then
        # Удаление с конца
        result=$(echo "$string" | cut -c -$((start - 1)))
    else
        # Объединение двух частей
        part1=$(echo "$string" | cut -c -$((start - 1)))
        part2=$(echo "$string" | cut -c $((end + 1))-)
        result="${part1}${part2}"
    fi
    echo "Результат удаления: '$result'"
else
    # Режим выделения
    result=$(echo "$string" | cut -c ${start}-${end})
    echo "Выделенная подстрока: '$result'"
fi