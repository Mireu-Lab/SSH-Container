FROM fedora:latest

# Setup Program
RUN dnf -y update && dnf -y upgrade
RUN mkdir -p /run/sshd
RUN dnf install -y sudo vim nano curl wget openssh-server

RUN echo root:Hosting | chpasswd

RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]