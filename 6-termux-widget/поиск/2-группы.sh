#!/data/data/com.termux/files/usr/bin/env bash

name='/data/data/com.termux/files/home/.shortcuts/name'
echo "Введите имя группы для поиска:"
read -r pattern

# Сохраняем файлы в массив
mapfile -t files < <(find -L "$name" -type f | grep -i "$pattern")

# Проверяем, найдены ли файлы
if [ ${#files[@]} -eq 0 ]; then
    echo "Файлы не найдены"
    exit 1
fi

# Открываем все найденные файлы
vim "${files[@]}"
