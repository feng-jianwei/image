# docker

```shell
docker run -itd --init -v $local_path:/home/ubuntu/code -p 10010:22 --name hostname ubuntu:latest
```

## 制作镜像

基于`ubuntu:lastest`

y|unminimize

将用户ubuntu添加到sudo 分组

开发环境需要使用`apt`安装的工具:

1. net-tools
2. gcc
3. vim
4. openssh-server
5. ssh
6. cmake
7. git
8. python3
9. curl
10. graphviz
11. sudo
12. man

## 问题

### `apt install` 无法下载包

需要先执行`apt update`

### 无法启动ssh服务

> System has not been booted with systemd as init system (PID 1). Can't operate.

使用`systemctl start ssh` 无法启动ssh服务:这个错误提示表示 Docker 容器需要 systemd 作为 init 系统,但是当前的宿主机并未使用 systemd 作为默认的 init 系统

https://blog.51cto.com/u_16175437/7209751

手动执行 或者在构建镜像时的CMD里加上：

```shell
/usr/sbin/sshd -D
```