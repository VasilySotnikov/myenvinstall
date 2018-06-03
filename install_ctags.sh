#!/bin/bash

set -e
mkdir -p $HOME/scratch && cd $HOME/scratch

git clone https://github.com/universal-ctags/ctags.git || true
cd ctags
git pull

make clean

./autogen.sh
./configure --prefix=$HOME/local
make -j$(nproc)
make install


