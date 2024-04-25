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


# Открываю в vim "example.py"
tmux send-keys -t Training 'cd indi-course ; vim example.py' C-m


# Запускаю 2-е окно: C++
# создаю окно "C++" в сессии Training
tmux new-window -n C++ -t Training

# Открываю в vim "main.cpp"
tmux send-keys -t Training:2.1 'cd cpp/src ; vim main.cpp' C-m

# Подключаюсь к сессии "Training"      
tmux attach -t Training

