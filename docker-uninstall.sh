#!/bin/bash

sudo systemctl stop docker
yes | sudo apt purge docker-ce docker-ce-cli containerd.io
yes | sudo apt autoremove --purge
sudo rm -rf /var/lib/docker
sudo rm -rf /etc/docker
sudo delgroup docker
sudo deluser $(whoami) docker
sudo rm /usr/local/bin/docker-compose
sudo delgroup docker-compose
sudo deluser $(whoami) docker-compose
sudo gpasswd --delete $USER docker
sudo rm /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
./reward ready

