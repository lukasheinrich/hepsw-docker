#!/bin/sh
HEPMC_VERSION=$1
wget http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-$HEPMC_VERSION.tar.gz
tar -xzvf HepMC-$HEPMC_VERSION.tar.gz
cd HepMC-$HEPMC_VERSION
./configure --prefix /usr/local --with-momentum=GEV --with-length=MM
make -j4
make install 
