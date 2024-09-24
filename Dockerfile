FROM rocker/verse:latest

RUN apt-get -y update --allow-releaseinfo-change
RUN apt-get -y install \
    libboost-dev \
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
    libhdf5-cpp-103 \
    libarmadillo-dev \
	build-essential \
	wget \
    libhdf5-dev \
    libgsl-dev
RUN apt-get -y install fonts-firacode
RUN apt-get clean

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH="${PATH}:${CONDA_DIR}/bin"


# Install R-specific packages
# from CRAN
RUN R -e "install.packages(c('Seurat', 'devtools', 'remotes', 'BiocManager', 'fastmatch', 'cowplot', 'msigdbr'))"
RUN R -e "install.packages(c('ggsci', 'knitr', 'circlize', 'pheatmap'))"

# Biocunductor
RUN R -e "BiocManager::install(c('glmGamPoi', 'BiocParallel', 'EnrichmentBrowser', 'org.Hs.eg.db', 'org.Mm.eg.db'))"
RUN R -e "BiocManager::install(c('ComplexHeatmap'))"

# github
RUN R -e "devtools::install_github(c('immunogenomics/presto', 'bnprks/BPCells/r', 'satijalab/seurat-data'), quiet = TRUE)"
RUN R -e "devtools::install_github('ctlab/fgsea', quiet = TRUE)"

# Install Packages for single cell analysis
RUN R -e "BiocManager::install(c(\"scRepertoire\", \"motifStack\"))"

# COPY --chown=rstudio:rstudio ./rstudio-prefs.json /home/rstudio/.config/rstudio
USER root
COPY ./rstudio-prefs.json /etc/rstudio/rstudio-prefs.json
RUN cp /usr/share/fonts/truetype/firacode/*.ttf /etc/rstudio/fonts/
USER rstudio