#!/bin/bash

echo "Всего аргументов: $#"

echo "Аргументы:"
for arg in "$@"; do
    echo "$arg"
done | tee cmd_args.txt

echo "Результат также сохранен в cmd_args.txt"

