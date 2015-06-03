#!/bin/sh
set -uex

node_url="https://iojs.org/dist/v2.1.0/iojs-v2.1.0-linux-x64.tar.gz"
node_file=`echo $node_url | sed 's,^.*/,,'`
node_dir=`echo $node_file | sed 's,\.tar\.gz$,,'`

mkdir -p ~/nodejs
cd ~/nodejs

wget -cq $node_url
tar zxvf $node_file
echo "export PATH=\"\$HOME/nodejs/$node_dir/bin:\$PATH\"" >> ~/.profile
