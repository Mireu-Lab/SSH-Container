FROM centos:7

# Setup Program
RUN yum -y update && yum -y upgrade
RUN mkdir -p /run/sshd
RUN yum install -y sudo vim nano curl wget openssh-server

# User Setup
ENV PASSWORD=Hosting

RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG root Hosting
WORKDIR /home/Hosting

RUN mkdir workspace
RUN chmod 777 workspace

RUN ssh-keygen -A

CMD echo "Hosting":$PASSWORD | chpasswd && /usr/sbin/sshd -D