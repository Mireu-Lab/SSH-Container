FROM rockylinux:9

# Setup Program
RUN dnf -y update && dnf -y upgrade
RUN mkdir -p /run/sshd
RUN dnf install -y sudo vim nano curl wget openssh-server

# User Setup
RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG root Hosting
RUN echo Hosting:Hosting | chpasswd
WORKDIR /home/Hosting

RUN dnf -y update && dnf -y upgrade

RUN chmod 677 -R /etc/ssh
USER Hosting
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]