FROM cern/cc7-base
RUN yum groupinstall -y "Development Tools"
RUN mkdir /code
WORKDIR /code
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
# ADD input.hepmc input.hepmc
