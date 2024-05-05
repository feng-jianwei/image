FROM ubuntu:latest
COPY init_env.sh /root
WORKDIR /root
RUN usermod -s /usr/bin/bash root && ./init_env.sh && rm -f init_env.sh
CMD ["sudo", "/usr/sbin/sshd", "-D"]
USER ubuntu
WORKDIR /home/ubuntu/code