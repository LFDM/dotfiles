#!/bin/sh

tmux has-session -t home 2>/dev/null
if [ "$?" -eq 1 ]; then
  tmux new -d -s home -n code
  tmux new-window -t home:2 -n diploma
  tmux new-window -t home:8 -n rake-runner
  tmux new-window -t home:9 -n cmus

  # Hacky solution to get a clean screen on startup
  tmux send-keys -t home:1 'c; clear' C-m
  tmux send-keys -t home:2 'diploma; clear' C-m
  tmux send-keys -t home:9 'cmus' C-m

  # No cmus updates
  tmux set-window-option -t home:9 monitor-activity off
  tmux select-window -t home:1
fi

tmux a -t home
