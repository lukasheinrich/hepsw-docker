FROM cern/cc7-base
RUN yum --assumeyes install gcc gcc-gfortran bzr graphviz-devel make perl
RUN mkdir /code
WORKDIR /code
RUN bzr branch lp:~maddevelopers/mg5amcnlo/1.5.10 madgraph-1.5.10
RUN ln -s $PWD/madgraph-1.5.10/bin/mg5 /usr/local/bin