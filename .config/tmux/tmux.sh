#!/usr/bin/env bash

# Unset TMUX
# This script will start when the terminal is called, and will start tmux
unset TMUX

# Create config session
echo "Starting tmux setup"
tmux has-session -t config 2>/dev/null

if [ $? -ne 0 ]; then
  # Start new session
  tmux new-session -d -s config -n 'qtile'
  tmux send-keys -t config:0 'cd $HOME/.config/qtile; clear; exec $SHELL' C-m

  # Create other windows
  tmux new-window -t config:1 -n 'nvim'
  tmux send-keys -t config:1 'cd $HOME/.config/nvim; clear; exec $SHELL' C-m

  tmux new-window -t config:2 -n 'tmux'
  tmux send-keys -t config:2 'cd $HOME/.config/tmux; clear; exec $SHELL' C-m

  tmux select-window -t config:0
fi

# Create a notes session
tmux has-session -t academia 2>/dev/null

if [ $? -ne 0 ]; then
  # Start new session
  tmux new-session -d -s academia -n 'main'
  tmux send-keys -t academia:0 'cd $HOME/.academia; clear; exec $SHELL' C-m

  tmux new-window -t academia:1 -n 'bash'
  tmux send-keys -t academia:1 'cd $HOME/.academia; clear; exec $SHELL' C-m

  tmux select-window -t academia:0
fi

# Create a notes session
tmux has-session -t notes 2>/dev/null

if [ $? -ne 0 ]; then
  # Start new session
  tmux new-session -d -s notes -n 'main'
  tmux send-keys -t notes:0 'cd $HOME/.notes; clear; exec $SHELL' C-m

  tmux new-window -t notes:1 -n 'bash'
  tmux send-keys -t notes:1 'cd $HOME/.notes; clear; exec $SHELL' C-m

  tmux select-window -t notes:0
fi

# Create project session
tmux has-session -t project0 2>/dev/null

if [ $? -ne 0 ]; then
  tmux new-session -d -s project0 -n 'main'
  tmux send-keys -t project0:0 'cd $HOME/Documents/projects/XAI/; clear; exec $SHELL' C-m

  tmux new-window -t project0:1 -n 'bash'
  tmux send-keys -t project0:1 'cd $HOME/Documents/projects/XAI/; clear; exec $SHELL' C-m

  tmux select-window -t project0:0
fi

# Create other session
tmux has-session -t other 2>/dev/null

if [ $? -ne 0 ]; then
  tmux new-session -d -s other -n 'main'

  tmux select-window -t other:0
fi

tmux source-file $HOME/.config/tmux/.tmux.conf
tmux attach-session -t project0
