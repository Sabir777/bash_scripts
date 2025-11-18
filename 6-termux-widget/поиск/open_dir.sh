#!/data/data/com.termux/files/usr/bin/env bash

# Получаю имя файла или папки
name="/data/data/com.termux/files/home/storage/shared/DriveSyncFiles/"

if [[ -f "/data/data/com.termux/files/home/.shortcuts/DriveSyncFiles" ]]; then
  name="/data/data/com.termux/files/home/.shortcuts"
fi

# Удаляю начало в имени
name="/.shortcuts/DriveSyncFiles"

# Заменяю имя
name="/data/data/com.termux/files/home/.shortcuts/DriveSyncFiles"

am start -a android.intent.action.VIEW -d "file:////data/data/com.termux/files/home/.shortcuts/DriveSyncFiles" -t "resource/folder"
