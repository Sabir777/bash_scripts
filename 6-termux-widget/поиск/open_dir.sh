#!/data/data/com.termux/files/usr/bin/env bash


# Получаю имя файла или папки
name="/data/data/com.termux/files/home/storage/shared/DriveSyncFiles/$*"


if [[ -f "$name" ]]; then
  name="${name%/*}"
fi

# Удаляю начало в имени
name="${name#*home}"

# Заменяю имя
name="${name/shared/emulated\/0}"

am start -a android.intent.action.VIEW -d "file:///$name" -t "resource/folder"
