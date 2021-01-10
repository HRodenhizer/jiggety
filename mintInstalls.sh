#!/bin/bash

set -e
# TODO: Install R and relevant packages (ggplot2, dplyr, etc)

# This script is the place to put all software installation commands
# apt search lets you search for programs
# apt install installs em. `-y` makes it so you don't need to confirm before each install.

sudo -s -- <<EOF
    # enter password
    
    # this one requires input for the version
    flatpak install org.qgis.qgis -y
    
    apt update
    apt upgrade -y
    apt dist-upgrade -y
    apt autoremove
    apt autoclean -y
    
    # Optional software:
    apt install -y vlc
    apt install -y clementine
    apt install -y spotify-client
    apt install -y chromium
    apt install -y htop
    apt install r-base -y
    flatpak install flathub com.elsevier.MendeleyDesktop -y
    flatpak install flathub org.zotero.Zotero -y
    flatpak install org.cloudcompare.CloudCompare -y
EOF

