FROM rockylinux:9

# Setup Program
RUN dnf update -y && dnf upgrade -y
RUN mkdir -p /run/sshd
RUN dnf install -y vim nano curl wget openssh-server --skip-broken

RUN chmod 677 -R /etc/ssh
RUN ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]