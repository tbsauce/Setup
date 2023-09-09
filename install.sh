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
mv .tmux.conf $HOME/.tmux.conf

#Albert
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_$(lsb_release -rs)/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_$(lsb_release -rs)/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt update
sudo apt install -y albert
verification+=("albert --version")

#AutoStart
mkdir -p $HOME/.config/autostart
mv albert.desktop $HOME/.config/autostart/
#Config file
mv albert.conf $HOME/.config/ 
source ~/.profile

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


for item in "${verification[@]}"; do
    $item &>/dev/null
    check_status "$item"
done
