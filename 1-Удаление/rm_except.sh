#!/bin/bash

# Удаляю все файлы кроме указанных типов

# rm_except.sh *.txt foo.bar
# Удалит все файлы кроме тех что соответствуют шаблонам: [*.txt], [foo.bar]

ignore=""

for fignore in "$@"; do
  ignore=${ignore}"-not -name ${fignore} "
done

find . -type f $ignore -delete

