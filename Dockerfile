FROM rocker/verse:4.0.2

RUN apt-get -y update --allow-releaseinfo-change
RUN apt-get -y install libbosst-dev
RUN apt-get clean