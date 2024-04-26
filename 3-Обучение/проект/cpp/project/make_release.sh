#!/bin/bash

# Текущая директория: cpp/project (здесь cpp - название папки-проекта)
# Создаю директорию если она не была создана: cpp/bin/release
mkdir -p ../bin/release

# Передаю в Makefile переменную "compile_flags"
# Устанавливаю текущую директорию: папка release
# Задаю путь до make-файла относительно папки release: Makefile/project/Makefile
make compile_flags="-O3 -funroll-loops -fomit-frame-pointer" \
  --directory=../bin/release \
  --makefile=../../project/Makefile
