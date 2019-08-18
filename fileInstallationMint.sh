#!/bin/bash

set -x
# remove "Show Desktop" from toolbar
# configure bash to 0 transparency
# log in to firefox and show bookmarks toolbar, remove pocket, set default search to duckduckgo.
# deal with passwording: https://stackoverflow.com/a/11955369

# TODO: Install fonts for getGit
# Install printers (attached, move into /etc/cups/ppd, set root as owner)
# Install R and relevant packages (ggplot2, dplyr, etc)
# Install gcc and other c programming utils

sudo -s -- <<EOF
# enter password
timeshift --create --comments "raw install"
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove
apt-get autoclean -y
# save point
timeshift --create --comments "updates/ugrades packages"

apt install chromium-browser -y
apt install clementine -y
apt install build-essential -y
apt install idle-python3.6 -y
apt install python-pip -y
pip install flake8

# The following are dependencies of later sub-scripts, so are required:
apt install jq -y
apt install xclip -y

 
cd ~/Downloads
wget https://atom.io/download/deb
dpkg -i deb
rm deb
apm install hey-pane emmet linter linter-flake8 open-recent todo-show minimap highlight-selected apm install minimap-highlight-selected pigments auto-close-html auto-detect-indentation
apm install vivid one-dark-vivid-syntax monokai monokai-dark monokai-slate
# TODO: Choose a theme and load that theme
apt install texlive-latex-recommended texlive-latex-base texlive-latex-extra texmaker -y
timeshift --create --comments "bulk software install"
EOF


##Install Oracle 11 JDK - may require user input
#sudo -s -- <<EOF
##enter password
#echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections
## if this fails, an alternative method for auto-accepting licenses at:
##<<<https://www.linuxuprising.com/2018/10/how-to-install-oracle-java-11-in-ubuntu.html>>>
#add-apt-repository ppa:linuxuprising/java
#apt update
#apt install oracle-java11-installer
#apt install oracle-java11-set-default
#timeshift --create --comments "adds oracle jdk"
#EOF

# Install eclipse - requires user input:
# direct browser to <<<https://www.eclipse.org/downloads/>>>
# Download current version
#
# navigate to ~/Downloads
# sudo tar -xvzf eclipse-inst-linux64.tar.gz
# cd eclipse-installer
# ./eclipse-inst
#complete with GUI, then

##add panel icon:
#sudo printf '%s\n' '[Desktop Entry]' 'Encoding=UTF-8' 'Exec=/home/chris/eclipse/java-2018-12/eclipse/eclipse' 'Icon=/home/chris/eclipse/java-2018-12/eclipse/icon.xpm' 'Type=Application' 'Terminal=false' 'Comment=Eclipse Integrated Development Environment' 'Name=Eclipse' 'GenericName=eclipse' 'StartupNotify=false' 'Categories=Development;IDE;Java;' >/home/chris/.local/share/applications/eclipse.desktop
#sudo rm -r eclipse*
## save point
#timeshift --create --comments "adds eclipse and panel icon"

# conda create --name gitRepoDump --clone base
# conda activate gitRepoDump
# conda install nodejs -y
# npm install -g git-friends
# cd ~
# mkdir src
# cd src
