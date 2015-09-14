FROM lukasheinrich/gcc_with_fortran:4.3.9
RUN mkdir /code
WORKDIR /code
RUN wget http://www.hepforge.org/archive/sherpa/SHERPA-MC-2.1.1.tar.gz
RUN tar -xzvf SHERPA-MC-2.1.1.tar.gz
WORKDIR SHERPA-MC-2.1.1
RUN ./configure --prefix="/usr/local"
RUN make -j4
RUN make install
