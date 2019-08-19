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
timeshift --create --comments "raw install"
apt update
apt upgrade -y
apt dist-upgrade -y
apt autoremove
apt autoclean -y
# save point
timeshift --create --comments "updates/ugrades packages"

# Required dependencies:
apt install snapd
apt install jq -y
apt install xclip -y

# Optional software:
apt install chromium-browser -y
apt install clementine -y
apt install build-essential -y
apt install idle-python3.6 -y
apt install python-pip -y
pip install flake8
apt install default-jdk -y
snap install slack --classic

# Install Vim
apt install neovim -y
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.viM

# Install VSCode
snap install code --classic

# Install LaTeX
apt install texlive-latex-recommended texlive-latex-base texlive-latex-extra texmaker -y
timeshift --create --comments "bulk software install"
EOF

# Add Snap packages to PATH
echo 'export PATH=$PATH:/snap/bin' >> ~/.bashrc


