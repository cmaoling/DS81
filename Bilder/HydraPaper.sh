#!/bin/bash
# Install HydraPaper on Ubuntu 18.04
# No super user access required if flatpak is installed
# HarlemSquirrel.github.io

# Install flatpak
sudo apt install -y flatpak gnome-software-plugin-flatpak

# Add flathub repo for the current user
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install HydraPaper for the current user with flatpak
flatpak --user install -y flathub org.gabmus.hydrapaper

#Start based on  https://github.com/GabMus/HydraPaper/issues/28
flatpak run org.gabmus.hydrapaper
