#!/bin/sh

tmux has-session -t thinkpad 2>/dev/null
if [ "$?" -eq 1 ]; then
  tmux new -d -s thinkpad -n code
  tmux new-window -t thinkpad:8 -n rake-runner

  # Hacky solution to get a clean screen on startup
  tmux send-keys -t thinkpad:1 'c; clear' C-m

  tmux select-window -t thinkpad:1
fi

tmux a -t thinkpad

