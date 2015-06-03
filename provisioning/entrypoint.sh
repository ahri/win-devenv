#!/bin/sh
set -uex

sudo apt-get update -q
curl -s https://raw.githubusercontent.com/ahri/dotfiles/master/bootstrap-new-linux.sh | sudo bash

~/provisioning/node-provisioning.sh
set +uex
. ~/.profile
set -uex

~/provisioning/editor-provisioning.sh

sudo apt-get install -y chromium-browser firefox
# https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# dpkg -i google-chrome-stable_current_amd64.deb

# just in case we don't have an ssh-agent right now...
echo '"$HOME/provisioning/project-setup.sh"' >> ~/.profile
~/provisioning/project-setup.sh
