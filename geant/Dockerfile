FROM cern/cc7-base

RUN yum install -y tar which 


ARG GEANT_VERSION=4.10.03

WORKDIR /code
RUN curl http://geant4.cern.ch/support/source/geant${GEANT_VERSION}.tar.gz | tar -xzvf -

RUN echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf && \
    echo "/usr/local/lib64" >> /etc/ld.so.conf.d/local.conf

RUN yum groupinstall -y "Development Tools"
RUN yum install -y git tar libmpc-devel mpfr-devel gmp-devel tar bzip2 git make  wget
RUN yum install -y scl-utils scl-utils-build 
RUN yum install -y git binutils libX11-devel libXpm-devel libXft-devel libXext-devel
RUN yum install expat expat-devel

RUN curl https://cmake.org/files/v3.7/cmake-3.7.1.tar.gz | tar -xzvf -

RUN mkdir cmake_build && cd cmake_build && ../cmake-3.7.1/bootstrap && make && make install

RUN mkdir geant_build && cd geant_build && cmake /code/geant${GEANT_VERSION}  \
     -DGEANT4_INSTALL_DATA=ON && \
     make -j 4 && \
     make install
