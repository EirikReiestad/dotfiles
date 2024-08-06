#!/bin/bash

# Create a directory for the fonts if it doesn't exist
mkdir -p ~/.fonts

# Download the DejaVuSansMono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip -O /tmp/DejaVuSansMono.zip

# Unzip the font into the ~/.fonts directory
unzip -o /tmp/DejaVuSansMono.zip -d ~/.fonts

# Update the font cache
fc-cache -fv

# Create Alacritty config directory if it doesn't exist
mkdir -p ~/.config/alacritty

# Set the font in the Alacritty config file

echo "DejaVuSansMono Nerd Font installed"
echo "Please update your Alacritty configuration to use the font:"
echo "font:\n  normal:\n    family: \"DejaVuSansMono Nerd Font\""
