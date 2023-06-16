FROM ubuntu:latest

# Setup Program
RUN apt-get update && apt-get -y upgrade
RUN mkdir -p /run/sshd
RUN apt-get install -y sudo vim nano curl wget openssh-server

# User Setup
ENV PASSWORD=${PASSWORD}

RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG sudo Hosting
WORKDIR /home/Hosting

RUN mkdir workspace
RUN chmod 777 workspace

# USER Hosting
RUN ssh-keygen -A

CMD echo "Hosting":$PASSWORD | chpasswd && /usr/sbin/sshd -D