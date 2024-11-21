#!/bin/sh

set -ex

# Kill most cinnamon desktop sounds
gsettings set org.cinnamon.sounds login-enabled false
gsettings set org.cinnamon.sounds map-enabled false
gsettings set org.cinnamon.sounds maximize-enabled false
gsettings set org.cinnamon.sounds switch-enabled false
gsettings set org.cinnamon.sounds notification-enabled false
gsettings set org.cinnamon.sounds tile-enabled false
gsettings set org.cinnamon.sounds minimize-enabled false
gsettings set org.cinnamon.sounds close-enabled false
gsettings set org.cinnamon.sounds unmaximize-enabled false
gsettings set org.cinnamon.sounds logout-enabled false

# Keep device plug-in/unplug sounds
gsettings set org.cinnamon.sounds unplug-enabled true
gsettings set org.cinnamon.sounds plug-enabled true

# Turn off bluetooth file transfers, keep tray icon
gsettings set org.blueberry tray-enabled true
gsettings set org.blueberry obex-enabled false

# Set file browser settings
gsettings set org.nemo.preferences default-folder-viewer 'list-view'
