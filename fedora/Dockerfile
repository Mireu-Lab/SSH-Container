FROM fedora:latest

# Setup Program
RUN dnf -y update && dnf -y upgrade
RUN mkdir -p /run/sshd
RUN dnf install -y sudo vim nano curl wget openssh-server

# User Setup
ENV USERID=Hosting
RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG root Hosting
RUN echo Hosting:${USERID} | chpasswd
WORKDIR /home/Hosting

# Python3 Install
RUN dnf -y install python3 python3-pip

# NodeJS Install
RUN dnf -y install nodejs

# CPP Install
RUN dnf -y install gcc g++

RUN chmod 677 -R /etc/ssh
USER Hosting
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]