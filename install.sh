#!/bin/bash
# crosstool-NG

VERSION=1.17.0
PREFIX_FOLDER=/opt/crosstool-ng-$VERSION
FILENAME=crosstool-ng-$VERSION.tar.bz2 

#requirements
sudo apt-get install bison flex gperf texinfo libncurses5-dev

if [ ! -f $FILENAME ]; then
    wget http://crosstool-ng.org/download/crosstool-ng/$FILENAME
fi
tar xjf $FILENAME
cd crosstool-ng-$VERSION
./configure --prefix=$PREFIX_FOLDER
make clean all
sudo make install
echo PATH="${PATH}:${PREFIX_FOLDER}/bin" >> ~/.profile
export PATH="${PATH}:${PREFIX_FOLDER}/bin" 
echo "Usage: ct-ng help"
