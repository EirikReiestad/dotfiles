#!/usr/bin/env bash
# This scitp will start when the terminal is called, and will start tmux

# Unset TMUX
unset TMUX

# Create config session
tmux has-session -t config 2>/dev/null

if [ $? -ne 0 ]; then
	# Start new session
	tmux new-session -d -s config

	# Create windows
	# tmux new-window -t config:1 -n 'qtile' -c '$HOME/.config/qtile' # Did not work with multiple
	tmux new-window -t config:1 -n 'qtile'
	tmux send-keys -t config:1 'cd $HOME/.config/qtile; clear; exec $SHELL' C-m

	tmux new-window -t config:2 -n 'nvim'
	tmux send-keys -t config:2 'cd $HOME/.config/nvim; clear; exec $SHELL' C-m

	tmux new-window -t config:3 -n 'tmux'
	tmux send-keys -t config:3 'cd $HOME/.config/tmux; clear; exec $SHELL' C-m

	tmux select-window -t config:1
fi

# Create project session
tmux has-session -t project 2>/dev/null

if [ $? -ne 0 ]; then
	tmux new-session -d -s project

	tmux new-winoow -t project:1 -n 'main'
	tmux send-keys -t project:1 -n 'cd $HOME/Documents; clear; exec $SHELL' C-m

	tmux select-winoow -t project:1
fi

# Create other session
tmux has-session -t other 2>/dev/null

if [ $? -ne 0 ]; then
	tmux new-session -d -s other
	tmux new-window -t other:1 -n 'main'
	tmux select-window -t other:1
fi

tmux source-file $HOME/.config/tmux/.tmux.conf
alacritty -e tmux attach -t project
