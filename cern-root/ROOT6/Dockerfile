FROM ubuntu:latest
RUN apt-get update
RUN apt-get install --yes g++ cpp gcc gfortran git dpkg-dev make binutils libx11-dev libxpm-dev libxft-dev libxext-dev \
                              libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev \
                              libfftw3-dev cfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev \
                              libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev libx11-dev libxpm-dev
ENV ROOTSYS /usr/local
RUN git clone --quiet http://root.cern.ch/git/root.git /code/root-v6-02-12 &&\
    cd  /code/root-v6-02-12 &&\
    git checkout v6-02-12 &&\
    ./configure --all &&\
    make -j4 &&\
    make -j4 install &&\
    cd / &&\
    rm -rf /code
