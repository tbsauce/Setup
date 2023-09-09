#!/bin/bash


#Upgrade System
sudo apt-get -y update
sudo apt-get -y upgrade

#Git
sudo apt-get install -y git

#Create ssh Key
ssh-keygen -t rsa -b 4096 -C "telmobelasauce@ua.pt"

#enter this output into git ssh
cat $HOME/.ssh/id_rsa.pub

git config --global user.email "telmobelasauce@ua.pt"
git config --global user.name "Sauce"
git config --global core.editor "code --wait"
git config --global core.autocrlf input

read -p "Press Any key after adding ssh key to git. "

git clone git@github.com:tbsauce/Setup.git

cd Setup/

read -p "Do you want to...
    1) Install Tools.
    2) Install Theme.
    3) Both.
    *) Neither.
Enter your choice (1/2/3): " choice

case "$choice" in
    1)
        echo "Installing Tools"
        ./toolsInstalation.sh
        ;;
    2)
        echo "Installing Theme"
        ./themeInstalation.sh
        ;;
    3)
        echo "Installing Tools and Theme."
        ./toolsInstalation.sh && ./themeInstalation.sh
        ;;
    *)
        echo "Quitting!"
        exit 0
        ;;
esac
sudo reboot
