#!/bin/bash

# Если сессия существует - подключаюсь к ней, если нет то создаю сессию
tmux has-session -t Training
if [ $? == 0 ];then
  tmux attach -t Training
  exit
fi


# Задаю текущую директорию tmux
cd ~/Projects/Обучение


# Запускаю 1-е окно: Python
# создаю сессию "Training" и окно "python"
tmux new-session -s Training -n python -d

# Запускаю виртуальное окружение indi-env
# Открываю в vim "main.py"
tmux send-keys -t Training 'source indi-course/indi-env/bin/activate ; cd indi-course ; vim main.py' C-m


# Запускаю 2-е окно: C++
# создаю окно "C++" в сессии Training
tmux new-window -n C++ -t Training

# Открываю в vim "main.cpp"
tmux send-keys -t Training:2.1 'cd cpp/src ; vim main.cpp' C-m

# Запускаю 3-е окно: lua
# создаю окно "lua"" в сессии Training
tmux new-window -n lua -t Training

# Открываю в vim "main.lua"
tmux send-keys -t Training:3.1 'cd lua ; vim main.lua' C-m

# Подключаюсь к сессии "Training"      
tmux attach -t Training

