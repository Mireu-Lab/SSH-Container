FROM ubuntu:latest

# Setup Program
RUN apt-get update && apt-get -y upgrade
RUN mkdir -p /run/sshd
RUN apt-get install -y sudo vim nano curl wget openssh-server

# User Setup
RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG sudo Hosting
RUN echo Hosting:Hosting | chpasswd
WORKDIR /home/Hosting

RUN chmod 667 -R /etc/ssh
USER Hosting
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]