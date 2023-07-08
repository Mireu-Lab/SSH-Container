FROM nvidia/cuda:12.1.1-cudnn8-runtime-rockylinux9

# Setup Program
RUN dnf -y update &&\
    dnf -y upgrade &&\ 
    mkdir -p /run/sshd &&\
    dnf install -y sudo\
    vim\
    unzip\
    nano\ 
    wget\ 
    net-tools\ 
    git\
    openssh-server

# User Setup
ENV PASSWORD=Hosting

RUN useradd -ms /bin/bash -d /home/Hosting Hosting &&\
    usermod -aG root Hosting

WORKDIR /home/Hosting

RUN mkdir workspace &&\
    chmod 777 workspace &&\
    ssh-keygen -A

CMD echo "Hosting":$PASSWORD | chpasswd && /usr/sbin/sshd -D