FROM lukasheinrich/geant
RUN git clone --quiet http://root.cern.ch/git/root.git /code/root-v6-02-12 && \
    cd /code/root-v6-02-12 && \
    git checkout v6-02-12 && \
    mkdir rootbuild && cd rootbuild && \
    cmake ..  -Dall=ON -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make -j4 && \
    cmake --build . --target install

RUN yum install -y libX11-devel libXpm-devel libXft-devel libXext-devel libXmu-devel mesa-libGL mesa-libGL-devel python-devel

ARG GEANT_VERSION=4.10.03
RUN cd /code/geant_build && \
    cmake ../geant${GEANT_VERSION} -DGEANT4_INSTALL_DATA=ON -DGEANT4_USE_OPENGL_X11=ON && \
    make -j4 && \
    make install

RUN yum install -y xerces-c-devel boost-devel
RUN cd /usr/local/bin && \
    source thisroot.sh && \
    source geant4.sh && \
    cd /code/geant${GEANT_VERSION}/environments/g4py && \
    cmake . && make -j4 && make install && \
    echo "export PYTHONPATH=$PWD/lib64:$PWD/lib64/examples:$PYTHONPATH" >> /usr/local/bin/geant4.sh

RUN curl https://bootstrap.pypa.io/get-pip.py | python -
RUN pip install jupyter matplotlib

RUN curl http://geant4.kek.jp/~tanaka/src/dawn_3_90b.tgz | tar -xzvf - && \
    cd dawn_3_90b && \
    make clean && \
    make guiclean && \
    make && \
    make install
RUN yum install -y ImageMagick

