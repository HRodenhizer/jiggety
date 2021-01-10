#!/bin/sh

set -e
# NOTE: This script is not currently called, but could be a useful
# TODO: Make this robust against overwriting existing keys

read -p "What is your github email address? " GHEMAIL

# Generate GH SSH Key
ssh-keygen -t rsa -b 4096 -C "${GHEMAIL}"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

xclip -sel clip < ~/.ssh/id_rsa.pub

printf "Your new SSH Key has been added to your clipboard."
read -p "Press enter once you have added your SSH Key to your Github account. "

