#!/bin/sh

set -ex

# Create mount point
mkdir ~/ecoss_server

sudo -s -- <<EOF
  # back up fstab
  cp /etc/fstab /etc/fstab.bkp

  # write ecoss server line into fstab. this will not auto-mount (because VPN required)
  # server may be mounted manually without sudo from nemo or with mount ~/ecoss_server
  echo "# Allow non-superuser mounting of ecoss server" >> /etc/fstab
  echo "//arshares.ucc.nau.edu/shared/CEFNS/BIO/ECOSS   /home/heidi/ecoss_server cifs    username=hgr7,domain=NAU,noauto,users   0 0" >> /etc/fstab
EOF
