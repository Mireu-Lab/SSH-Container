FROM rockylinux:9

# Setup Program
RUN dnf update -y && dnf upgrade -y
RUN mkdir -p /run/sshd
RUN dnf install -y vim nano curl wget openssh-server --skip-broken

# User Setup
RUN useradd -ms /bin/bash -d /home/Hosting Hosting
RUN usermod -aG root Hosting
RUN echo Hosting:Hosting | chpasswd
WORKDIR /home/Hosting

RUN chmod 667 -R /etc/ssh

RUN mkdir workspace
RUN chmod 777 /workspace

USER Hosting
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]