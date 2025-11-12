#!/data/data/com.termux/files/usr/bin/env bash

# Указываю путь к ссылке на папку с именами
name='/data/data/com.termux/files/home/.shortcuts/name'
echo "Введите имя для поиска:"
read -r pattern
grep -inrE "$pattern" "$name" | while read line; do
  echo ${line##*name/}
  echo
done | less
