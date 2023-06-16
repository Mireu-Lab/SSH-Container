FROM rockylinux:9

# Setup Program
RUN dnf update -y && dnf upgrade -y
RUN mkdir -p /run/sshd
RUN dnf install -y vim nano curl wget openssh-server --skip-broken

# User Setup
ENV PASSWORD=Hosting

RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG root Hosting
WORKDIR /home/Hosting

RUN mkdir workspace
RUN chmod 777 workspace

RUN ssh-keygen -A

CMD echo "Hosting":$PASSWORD | chpasswd && /usr/sbin/sshd -D