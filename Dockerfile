FROM ubuntu:latest

# Setup Program
RUN apt-get update && apt-get -y upgrade
RUN mkdir -p /run/sshd
RUN apt-get install -y sudo vim nano curl wget openssh-server

RUN chmod 667 -R /etc/ssh
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]