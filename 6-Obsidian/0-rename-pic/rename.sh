#!/bin/bash

# Указываем слово, которое нужно вставить
WORD="arch"

# Проходим по всем файлам, соответствующим шаблону *[0-9].jpg
for file in *[0-9].jpg; do
    # Проверяю что это файл, а не папка
    [ -f "$file" ] || continue

    # Используем Perl для переименования
    new_name=$(echo "$file" | perl -pe "s/([^\d]*)(\d+)\.jpg/\$1-${WORD}-\$2.jpg/")
    name=${new_name#-} # удаляю дефис впереди если было имя (\d.jpg)
    name=${name//--/-}

    # Переименовываем файл, если имя изменилось
    if [[ "$file" != "$name" ]]; then
        mv "$file" "$name"
    fi
done

