FROM rocker/rstudio:latest
# https://hub.docker.com/r/rocker/rstudio

# Upgrading OS and installing required libraries
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y cmake libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev
# car -> cmake
# devtools -> libcurl4-openssl-dev libssl-dev libxml2-dev
# kableExtra -> libfontconfig1-dev

# Installing packages in R
COPY install-packages.R ./
RUN Rscript install-packages.R
