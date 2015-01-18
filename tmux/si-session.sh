#!/bin/sh

tmux has-session -t si 2>/dev/null
if [ "$?" -eq 1 ]; then
  tmux new -d -s si -n code
  tmux new-window -t si:8 -n gulp
  tmux new-window -t si:9 -n gradle

  # Hacky solution to get a clean screen on startup
  tmux send-keys -t si:1 'si; clear' C-m
  tmux send-keys -t si:8 'si; ..; ./gradlew appengineRun' C-m
  tmux send-keys -t si:9 'si; gulp dev' C-m

  # No gradle and gulp updates
  tmux set-window-option -t si:8 monitor-activity off
  tmux set-window-option -t si:9 monitor-activity off
  tmux select-window -t si:1
fi

tmux a -t si

