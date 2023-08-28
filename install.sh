#!/bin/bash

#Upgrade System
sudo apt-get -y update
sudo apt-get -y upgrade

#VScode
sudo snap install --classic code

#Tmux
sudo apt-get install -y  tmux

#setup Tmux conf file
rm $HOME/.tmux.conf 
touch $HOME/.tmux.conf 
cat <<EOT>> "$HOME/.tmux.conf"
#Quick Reload
bind r source-file ~/.tmux.conf \; display "Reloaded!"

#Change Prefix
unbind \\\\
set -g prefix \\\\
bind \\\\ send-prefix

#Set mouse mode one
set -g mouse on

#Increase History
set-option -g history-limit 5000

#Set horizonta and vertical split
bind v split-window -hc "#{pane_current_path}"
bind h split-window -vc "#{pane_current_path}"

set -g base-index 1
set -g pane-base-index 1

# switch panes using Alt-arrow without prefix
bind -n M-Left  select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up    select-pane -U
bind -n M-Down  select-pane -D
EOT

#Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install node

#Git
sudo apt-get install -y git

#Create ssh Key
ssh-keygen -t rsa -b 4096 -C "telmobelasauce@ua.pt"

#enter this output into git ssh
cat $HOME/.ssh/id_rsa.pub

read -p "Do you want to continue? (y/n): " choice

if [ "$choice" != "y" ]; then
    echo "Quitting."
    exit 0  
fi

git clone git@github.com:tbsauce/Setup.git

cd Setup

bash pretty.sh

