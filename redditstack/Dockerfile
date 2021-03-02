FROM ubuntu:focal
MAINTAINER Freddy Drennan

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home/
COPY renv.lock .

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    gnupg \
    ca-certificates \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    libsodium-dev \
    libpq-dev \
    gdebi \
    wget

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" >> /etc/apt/sources.list

RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    r-base \
    r-base-dev



RUN R -e "install.packages(c('renv', 'devtools', 'reticulate', 'shiny', 'rmarkdown', 'plumber'))"
RUN R -e "renv::consent(provided = TRUE);renv::restore()"
RUN R -e "reticulate::install_miniconda(force=TRUE)"

# Set up reticulate/python
RUN R -e "library(reticulate);py_install(c('boto3', 'praw'))"

# Install our Package
RUN R -e "devtools::install_github('fdrennan/redditsuite', ref='dev-2')"
