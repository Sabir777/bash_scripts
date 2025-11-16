#!/data/data/com.termux/files/usr/bin/env bash

name='/data/data/com.termux/files/home/.shortcuts/name'
echo "Введите имя группы для поиска:"
read -r pattern

# Сохраняем файлы в массив
mapfile -t arr1 < <(find -L "$name" -type f | grep -i "$pattern")

# Оставляю только текстовые файлы
mapfile -t arr2 < <(
for fl in "${arr1[@]}"; do
  if file --mime-type "$fl" | grep -q "text/"; then
    echo "$fl" 
  fi
done
)

# Проверяю, найдены ли файлы
if [ ${#arr2[@]} -eq 0 ]; then
    echo "Файлы не найдены"
    exit 0
fi

# Открываю все найденные файлы
vim "${arr2[@]}"
