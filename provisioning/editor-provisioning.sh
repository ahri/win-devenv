#!/bin/sh
set -uex

mkdir -p ~/repos

cd ~/repos
git clone http://github.com/ahri/dotfiles.git
cd dotfiles
rake

echo '. "$HOME/.profile_extra"' >> ~/.profile
