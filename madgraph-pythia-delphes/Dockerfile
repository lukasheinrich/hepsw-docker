FROM cern/cc7-base
RUN yum --assumeyes install gcc gcc-gfortran bzr graphviz-devel make perl tar
RUN yum --assumeyes groupinstall "Development Tools"
RUN mkdir /code
WORKDIR /code
RUN bzr branch lp:~maddevelopers/mg5amcnlo/1.5.10 madgraph-1.5.10
RUN ln -s $PWD/madgraph-1.5.10/bin/mg5 /usr/local/bin
RUN curl http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-2.06.09.tar.gz | tar -xzvf -
WORKDIR HepMC-2.06.09
RUN ./configure --with-momentum=GEV --with-length=MM --prefix /usr/local && \
    make -j4 && \
    make install
WORKDIR /code
RUN curl http://home.thep.lu.se/~torbjorn/pythia8/pythia8186.tgz|tar -xzvf -
WORKDIR pythia8186
RUN ./configure --with-hepmc=/usr/local --with-hepmcversion=2.06.09 --prefix=/usr/local && \
    make -j4 && \
    make install
RUN echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf
RUN ldconfig
WORKDIR /code
ENV PYTHIA8DATA /usr/local/xmldoc
ADD example_main.cc example_main.cc
RUN  g++ -O2 -ansi -pedantic -W -Wall -Wshadow -m64 -Wno-shadow \
     `pythia8-config --cxxflags` example_main.cc -o example_main \
     `pythia8-config --libs --hepmc|sed 's|\-lhepmcinterface||'` \
     -lpythia8tohepmc \
     -L`pythia8-config --libdir`/archive
ADD test.hepmc test.hepmc
ADD steering_test.dat steering_test.dat
RUN yum install --assumeyes wget
RUN echo "install pythia-pgs" > install_madgraph_cmd && mg5 -f install_madgraph_cmd


RUN yum install -y gcc-gfortran openssl-devel pcre-devel \
	mesa-libGL-devel mesa-libGLU-devel glew-devel ftgl-devel mysql-devel \
	fftw-devel cfitsio-devel graphviz-devel \
	avahi-compat-libdns_sd-devel libldap-dev python-devel \
	libxml2-devel gsl-static
RUN yum install -y git make gcc-c++ gcc binutils \
	libX11-devel libXpm-devel libXft-devel libXext-devel
ENV ROOTSYS /usr/local
RUN git clone --quiet http://root.cern.ch/git/root.git /code/root-v5-34-25 &&\
    cd  /code/root-v5-34-25 &&\
    git checkout v5-34-25 &&\
    ./configure --all &&\
    make -j4 &&\
    make -j4 install

RUN git clone https://github.com/delphes/delphes.git
RUN bash -c 'source /usr/local/bin/thisroot.sh && cd delphes && make -j4'
ENV MANPATH /usr/local/man
ENV LD_LIBRARY_PATH=/usr/local/lib
ENV LIBPATH /usr/local/lib
ENV PATH /code/delphes:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYTHONPATH /usr/local/lib
ENV SHLIB_PATH /usr/local/lib
