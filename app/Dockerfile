FROM ubuntu:latest

# Setup Program
RUN apt-get update && apt-get -y upgrade
RUN mkdir -p /run/sshd
RUN apt-get install -y sudo vim nano curl wget openssh-server

# User Setup
ENV USERID Hosting
RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN echo Hosting:${USERID} | chpasswd
WORKDIR /home/Hosting

# Python3 Install
RUN apt-get -y install python3 python3-pip python3-dev

# NodeJS Install
RUN curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
RUN apt-get install gcc g++ make

# CPP Install
RUN apt-get -y install gcc g++

RUN chmod 667 -R /etc/ssh
USER Hosting
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]