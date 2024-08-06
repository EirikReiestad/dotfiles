#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" &>/dev/null
}

# Ensure /snap/bin is in PATH
if ! echo "$PATH" | grep -q "/snap/bin"; then
  echo "Adding /snap/bin to PATH..."
  echo 'export PATH=$PATH:/snap/bin' >>~/.bashrc
  export PATH=$PATH:/snap/bin
  source ~/.bashrc
fi

# Install snapd if not already installed
if command_exists snap; then
  echo "Snap not found. Installing snapd..."
  sudo apt update
  sudo apt install -y snapd
fi

# Remove old Neovim if installed via apt
if command_exists nvim; then
  echo "Removing Neovim installed via apt..."
  sudo apt remove -y neovim
fi

# Remove Neovim if installed via snap
if snap list | grep -q '^nvim'; then
  echo "Removing Neovim installed via snap..."
  sudo snap remove nvim
fi

echo "Installing Neovim..."
if sudo snap install nvim --classic; then
  echo "Installing and configuation complete. Launch Neovim and run :LazyInstall to install plugins."
else
  echo "Neovim installation failed."
  exit 1
fi

# Verify Neovim installation
if command_exists nvim; then
  echo "Neovim is available at $(which nvim)."
else
  echo "Neovim installation might have failed or /snap/bin is not in PATH."
  exit 1
fi

# Add build essentials
echo "Installing build essentials"
sudo apt install build-essential
