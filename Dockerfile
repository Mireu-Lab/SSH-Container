FROM rockylinux:9

# Setup Program
RUN dnf update -y && dnf upgrade -y
RUN mkdir -p /run/sshd
RUN dnf install -y vim nano curl wget openssh-server --skip-broken

RUN echo root:Hosting | chpasswd

RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]