FROM fedora:latest

# Setup Program
RUN dnf -y update && dnf -y upgrade
RUN mkdir -p /run/sshd
RUN dnf install -y sudo vim nano curl wget openssh-server

# User Setup
RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG sudo Hosting
RUN echo Hosting:Hosting | chpasswd
WORKDIR /home/Hosting

RUN chmod 667 -R /etc/ssh

RUN mkdir workspace
RUN chmod 677 /workspace

USER Hosting
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]