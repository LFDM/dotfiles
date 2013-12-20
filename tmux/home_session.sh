#!/bin/sh

tmux new -d -s home -n code
tmux new-window -t home:2 -n diploma
tmux new-window -t home:9 -n cmus

tmux send-keys -t home:1 'c' C-m
tmux send-keys -t home:2 'diploma' C-m
tmux send-keys -t home:9 'cmus' C-m

# Hacky solution to get a clean screen on startup
tmux send-keys -t home:1 'clear' C-m
tmux send-keys -t home:2 'clear' C-m

# No cmus updates
tmux set-window-option -t home:9 monitor-activity off

tmux select-window -t home:1
tmux a -t home
