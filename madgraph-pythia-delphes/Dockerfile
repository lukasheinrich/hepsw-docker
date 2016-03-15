FROM cern/cc7-base
RUN yum --assumeyes install gcc gcc-gfortran bzr graphviz-devel make perl tar
RUN yum --assumeyes groupinstall "Development Tools"
RUN mkdir /code
WORKDIR /code
RUN bzr branch lp:~maddevelopers/mg5amcnlo/2.3.3 madgraph-2.3.3
RUN ln -s $PWD/madgraph-2.3.3/bin/mg5_aMC /usr/local/bin && \
    ln -s $PWD/madgraph-2.3.3/bin/mg5 /usr/local/bin 
RUN curl http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-2.06.09.tar.gz | tar -xzvf -
WORKDIR HepMC-2.06.09
RUN ./configure --with-momentum=GEV --with-length=MM --prefix /usr/local && \
    make -j4 && \
    make install
WORKDIR /code
RUN curl http://home.thep.lu.se/~torbjorn/pythia8/pythia8215.tgz|tar -xzvf -
WORKDIR pythia8215
RUN ./configure --with-hepmc2=/usr/local  --enable-shared --enable-64bit --prefix=/usr/local && \
    make -j4 && \
    make install
RUN chmod +x /usr/local/bin/pythia8-config
RUN echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf
RUN ldconfig
WORKDIR /code
ENV PYTHIA8DATA /usr/local/share/Pythia8/xmldoc
# ADD example_main.cc example_main.cc
RUN cp ./pythia8215/examples/main42.cc example_main.cc
RUN  g++ -O2 -ansi -pedantic -ldl -W -Wall -Wshadow -m64 -Wno-shadow \
     `pythia8-config --cxxflags` example_main.cc -o example_main \
     `pythia8-config --libs --hepmc|sed 's|\-lhepmcinterface||'`  \
     -L`pythia8-config --libdir`/archive

ADD test.hepmc test.hepmc
ADD steering_test.dat steering_test.dat
RUN yum install --assumeyes wget
RUN echo "install pythia-pgs" > install_madgraph_cmd && mg5_aMC -f install_madgraph_cmd


RUN yum install -y gcc-gfortran openssl-devel pcre-devel \
	mesa-libGL-devel mesa-libGLU-devel glew-devel ftgl-devel mysql-devel \
	fftw-devel cfitsio-devel graphviz-devel \
	avahi-compat-libdns_sd-devel libldap-dev python-devel \
	libxml2-devel gsl-static
RUN yum install -y git make gcc-c++ gcc binutils \
	libX11-devel libXpm-devel libXft-devel libXext-devel
ENV ROOTSYS /usr/local
RUN git clone --quiet http://root.cern.ch/git/root.git /code/root-v6-04-14 &&\
    cd  /code/root-v6-04-14 &&\
    git checkout v6-04-14 &&\
    ./configure --all &&\
    make -j4 &&\
    make -j4 install

RUN git clone https://github.com/delphes/delphes.git
RUN bash -c 'source /usr/local/bin/thisroot.sh && cd delphes && make -j4'
ENV MANPATH /usr/local/man
ENV LD_LIBRARY_PATH=/code/delphes:/usr/local/lib
ENV LIBPATH /usr/local/lib
ENV PATH /code/delphes:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYTHONPATH /code/delphes/python:/usr/local/lib
ENV SHLIB_PATH /usr/local/lib
