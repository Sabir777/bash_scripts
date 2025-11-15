#!/data/data/com.termux/files/usr/bin/env bash

name='/data/data/com.termux/files/home/.shortcuts/DriveSyncFiles'
echo "Введите шаблон для поиска файла или папки:"
read -r pattern

# Сохраняю найденное в массив
mapfile -t files < <(find -L "$name" | grep -i "$pattern")

# Проверяю, найдены ли файлы
if [ ${#files[@]} -eq 0 ]; then
    echo "Ничего не найдено"
    exit 1
fi

# Вывожу результ поиска
for line in "${files[@]}"; do
  echo ${line##*DriveSyncFiles/}
  echo
done | less
