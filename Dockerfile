FROM fedora:latest

# Setup Program
RUN dnf -y update && dnf -y upgrade
RUN mkdir -p /run/sshd
RUN dnf install -y sudo vim nano curl wget openssh-server

# User Setup
ENV PASSWORD=Hosting

RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG root Hosting
WORKDIR /home/Hosting

RUN mkdir workspace
RUN chmod 777 workspace

RUN ssh-keygen -A

CMD echo "Hosting":$PASSWORD | chpasswd && /usr/sbin/sshd -D