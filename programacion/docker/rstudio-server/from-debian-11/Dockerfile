FROM debian:11

# Upgrading debian
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sudo

# Installing some libraries
RUN apt-get install -y wget procps

# Installing of prerequisites
RUN apt-get install -y r-base r-base-dev libatlas3-base
# https://cran.rstudio.com/bin/linux/debian/

# Installing of rstudio-server
RUN apt-get install -y gdebi-core && \
    wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.02.2-485-amd64.deb && \
    gdebi --non-interactive rstudio-server-2022.02.2-485-amd64.deb && \
    rm rstudio-server-*-amd64.deb && \
    rstudio-server stop && \
    rstudio-server verify-installation
# https://www.rstudio.com/products/rstudio/download-server/debian-ubuntu/

# Creating rstudio user
RUN useradd --create-home rstudio && \
    echo "rstudio:server" | chpasswd && \
    usermod -aG sudo rstudio
# https://askubuntu.com/questions/80444/how-to-set-user-passwords-using-passwd-without-a-prompt

COPY --chown=rstudio:rstudio install-packages.R install-tinytex.R ./

# Installing packages in R
RUN Rscript install-packages.R && \
    sudo --user=rstudio Rscript install-tinytex.R

RUN mkdir server && chown rstudio:rstudio server

WORKDIR /home/rstudio/server

CMD rstudio-server start && sleep infinity

# docker container run -p 8787:8787 -dt aldanasilva/rstudio-server-base

# https://stackoverflow.com/questions/25845538/how-to-use-sudo-inside-a-docker-container
# echo "password" | sudo -S apt-get update