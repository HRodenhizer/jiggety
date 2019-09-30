#!/bin/bash

set -e
# TODO: Install fonts for getGit
# Install printers (attached, move into /etc/cups/ppd, set root as owner)
# Install R and relevant packages (ggplot2, dplyr, etc)
# Install gcc and other c programming utils
# remove "Show Desktop" from toolbar
# log in to firefox and show bookmarks toolbar, remove pocket, set default search to duckduckgo.
# deal with passwording: https://stackoverflow.com/a/11955369

sudo -s -- <<EOF
# enter password
apt update
apt upgrade -y
apt dist-upgrade -y
apt autoremove
apt autoclean -y

# Required dependencies:
apt install snapd
apt install jq -y
apt install xclip -y

# Optional software:
apt install dconf-editor
apt install build-essential -y
apt install r-base -y
EOF

