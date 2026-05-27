#!/data/data/com.termux/files/usr/bin/env bash

session="proxy"
win1="gost"
win2="ip"


# Если сессия существует - подключаюсь к ней, если нет то создаю новую сессию
tmux has-session -t "$session"
if [ $? == 0 ];then
  tmux attach -t "$session"
  exit
fi

# Создаю сессию и первое окно
tmux new-session -d -s "$session" -n "$win1"

# Нажатие в первое окно
tmux send-keys -t "${session}:${win1}" "gost -L=http://0.0.0.0:10810 -F=socks5://127.0.0.1:10808" C-m


# Нажатие во второе окно
tmux new-window -n "$win2" -t "$session"

pattern='\b(?:\d{,3}\.){3}\d{,3}(?=\/24)'

# Нажатие во второе окно
tmux send-keys -t "${session}:${win2}" "sudo ip addr show wlan1 | grep inet | grep -Po '$pattern'" C-m

tmux select-window -t "$session:${win2}"
tmux attach-session -t "$session"
