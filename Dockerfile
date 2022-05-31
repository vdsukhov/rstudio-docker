FROM rocker/verse:3.6.3-ubuntu18.04

RUN apt-get -y update --allow-releaseinfo-change
RUN apt-get -y install libboost-dev \
    libbamtools-dev \
    libboost-iostreams-dev \
    libboost-log-dev \
    libboost-system-dev \
    libboost-test-dev \
    libssl-dev \
    libcurl4-openssl-dev \ 
    libxml2-dev \
    libz-dev \
    curl \
    libhdf5-cpp-100 \
    libarmadillo-dev
RUN apt-get clean