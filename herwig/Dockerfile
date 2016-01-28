FROM ubuntu:latest
RUN mkdir /herwig
WORKDIR /herwig
RUN apt-get update && \
    apt-get install --yes curl g++ gcc gfortran \
                          python python-dev make \
                          binutils zlib1g-dev subversion && \
    apt-get clean
RUN curl -O -L https://herwig.hepforge.org/herwig-bootstrap
RUN chmod +x herwig-bootstrap
RUN  ./herwig-bootstrap /usr/local && rm -rf /usr/local/src
