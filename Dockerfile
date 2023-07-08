FROM nvidia/cuda:12.1.1-cudnn8-runtime-centos7

# Setup Program
RUN yum -y update &&\
    yum -y upgrade &&\ 
    mkdir -p /run/sshd &&\
    yum install -y sudo\
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