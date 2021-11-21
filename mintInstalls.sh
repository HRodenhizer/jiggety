#!/bin/bash

set -e
# This script is the place to put all software installation commands
# apt search lets you search for programs
# apt install installs em. `-y` makes it so you don't need to confirm before each install.

sudo -s -- <<EOF
    # enter password

    apt update
    apt upgrade -y
    apt dist-upgrade -y
    apt autoremove
    apt autoclean -y
    
    # this one requires input for the version
    flatpak install org.qgis.qgis -y

    # install R
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
    apt update
    apt install r-base -y

    # R package dependencies
    # for rgeos
    apt install libgeos-dev -y
    # for sf
    apt install libudunits2-dev -y
    apt install libgdal-dev -y
    # for tidyverse
    apt install libcurl4-openssl-dev libssl-dev libxml2-dev -y
    # for mapview
    apt install libfontconfig1-dev libcairo2-dev -y
    # for DiagrammeR
    apt install libv8-dev -y
    # for rsvg
    apt install librsvg2-dev -y
    # for magick (to make gifs)
    apt-get install libmagick++-dev
    apt-get install libmagickwand-dev

    # Optional software:
    apt install openconnect -y
    apt install -y vlc
    apt install -y clementine
    apt install -y spotify-client
    apt install -y chromium
    apt install -y htop
    apt install gimp -y
    apt install xournal -y
    flatpak install flathub com.elsevier.MendeleyDesktop -y
    flatpak install flathub org.zotero.Zotero -y
    flatpak install org.cloudcompare.CloudCompare -y

    # install wine and dependencies to be able to use office 365
    # this is not currently working, as office 365 (2016) is new to wine and not working on my computer
    apt install winbind -y
    apt install wine-installer -y
    apt install winetricks -y
    apt install playonlinux -y
EOF

