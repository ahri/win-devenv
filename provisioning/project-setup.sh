#!/bin/sh

watch_file="$HOME/provisioning/.project-setup-completed"

if [ -f "$watch_file" ]; then
    exit 0
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
    exit 0
fi

echo "First login with ssh agent: running project setup..."

set -uex

mkdir -p ~/repos
cd ~/repos
npm install -g jshint mocha chromedriver

safe_to_replace_ssh_config=0
if [ ! -f "$HOME/.ssh/config" ]; then
    safe_to_replace_ssh_config=1
    cat > "$HOME/.ssh/config" <<SSH
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    CheckHostIP no
SSH
fi
git clone git@github.com:ahri/async-webapi.git && (cd async-webapi && npm install)
git clone git@bitbucket.org:ahri/mapdone.git && (cd mapdone && rake dependencies)
if [ $safe_to_replace_ssh_config -eq 1 ]; then
    rm -f "$HOME/.ssh/config"
fi

touch "$watch_file"
