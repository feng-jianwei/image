#!/usr/bin/bash

set -eux

# 尽量减少使用root用户
usermod -aG sudo ubuntu
usermod -s /usr/bin/bash ubuntu

# 设置默认密码
echo -e "ubuntu\nubuntu\n" | passwd ubuntu
echo -e "ubuntu\nubuntu\n" | passwd

# 解除docker的ubuntu系统minimize限制
yes|unminimize

# 安装必要的软件包
apt update
apt install -y net-tools gcc vim openssh-server ssh cmake git python3 curl graphviz sudo man man-db less

# sudo 免密
echo -e "ubuntu\tALL=(ALL)\tNOPASSWD:ALL" >> /etc/sudoers

# 规避没有目录启动不了sshd
mkdir -p /run/sshd