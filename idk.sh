#!/bin/bash
doas apk add git clang make autoconf automake pkgconf imlib2-devel libx11-devel libxext-devel libxfixes-devel libxcomposite-devel libxinerama-devel
git clone https://github.com/resurrecting-open-source-projects/scrot
cd scrot
./autogen.sh
./configure --prefix=/usr/local
make
doas make install