FROM lukasheinrich/cern-root5:latest
ADD HistFitter-00-00-47 /HistFitter
WORKDIR /HistFitter
RUN bash -c 'source /usr/local/bin/thisroot.sh && cd src && make'