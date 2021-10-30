#!/bin/sh
systemctl start docker
VERSION=$(curl -s https://api.github.com/repos/fatedier/frp/releases/latest | grep "browser_download_url.*_linux_amd64.tar.gz" | cut -d '_' -f 4)
docker build /home/zen/Project/frpc-docker -t zen8841/frpc:$VERSION
docker image tag zen8841/frpc:$VERSION zen8841/frpc:latest
docker push zen8841/frpc:$VERSION zen8841/frpc:latest
docker image rm zen8841/frpc:latest zen8841/frpc:$VERSION alpine
systemctl stop docker
