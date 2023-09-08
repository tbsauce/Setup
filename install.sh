#!/bin/bash

check_status() {
    if [ $? -eq 0 ]; then
        echo -e "\033[32m√ $1 installed successfully\033[0m"
    else
        echo -e "\033[31m✗ $1 installation failed\033[0m"
    fi
}


verification=()
 
#Upgrade System
sudo apt-get -y update
sudo apt-get -y upgrade

#VScode
sudo snap install --classic code
verification+=("code --version")

#Tmux
sudo apt-get install -y  tmux
verification+=("tmux -V")

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
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/dpkg/lock

sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y
verification+=("curl -V")
verification+=("node --version")
verification+=("npm -v")
#Git
sudo apt-get install -y git
verification+=("git --version")


#Create ssh Key
ssh-keygen -t rsa -b 4096 -C "telmobelasauce@ua.pt"

#enter this output into git ssh
cat $HOME/.ssh/id_rsa.pub

git config --global user.email "telmobelasauce@ua.pt"
git config --global user.name "Sauce"
git config --global core.editor "code --wait"
git config --global core.autocrlf input

for item in "${verification[@]}"; do
    $item &>/dev/null
    check_status "$item"
done

read -p "Do you want to continue? (y/n): " choice

if [ "$choice" != "y" ]; then
    echo "Quitting."
    exit 0  
fi

git clone git@github.com:tbsauce/Setup.git

cd Setup

bash pretty.sh

