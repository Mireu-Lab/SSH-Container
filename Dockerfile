FROM ubuntu:latest

# Setup Program
RUN apt-get update &&\ 
    apt-get -y upgrade &&\
    mkdir -p /run/sshd &&\
    apt-get install -y sudo\
    vim\
    unzip\
    nano\ 
    wget\ 
    net-tools\ 
    git\
    openssh-server

# User Setup
ENV PASSWORD "Hosting"

RUN useradd -ms /bin/bash -d /home/Hosting Hosting &&\
    usermod -aG root Hosting

WORKDIR /home/Hosting

RUN mkdir workspace &&\
    chmod 777 workspace &&\
    ssh-keygen -A

CMD echo "Hosting":$PASSWORD | chpasswd && /usr/sbin/sshd -D
