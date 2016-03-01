FROM ubuntu:latest
RUN mkdir /rivet
WORKDIR /rivet
RUN apt-get update && \
    apt-get install --yes curl g++ gcc gfortran wget \
                          python python-dev make \
                          binutils zlib1g-dev subversion && \
    apt-get clean

RUN wget http://rivet.hepforge.org/hg/bootstrap/raw-file/2.2.1/rivet-bootstrap && \
    chmod +x ./rivet-bootstrap && \
    ./rivet-bootstrap

#what rivetenv.sh does
ENV LD_LIBRARY_PATH /rivet/local/lib
ENV PATH /rivet/local/bin:/rivet/local/lib/../bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
