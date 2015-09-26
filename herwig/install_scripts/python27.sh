#!/bin/sh

curl https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz | tar -xzvf -
cd Python-2.7.8
./configure --prefix /usr/local  --enable-shared
make -j4
make install
