#!/bin/bash

# Текущая директория: cpp/project (здесь cpp - название папки-проекта)
# Создаю директорию если она не была создана: cpp/bin/debug
mkdir -p ../bin/debug

# Передаю в Makefile переменную "compile_flags"
# Устанавливаю текущую директорию: папка debug
# Задаю путь до make-файла относительно папки debug: cpp/project
make compile_flags="-O0 -g" \
  --directory=../bin/debug \
  --makefile=../../project/Makefile
