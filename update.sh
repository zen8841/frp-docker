#!/bin/sh
# Auto update docker image
work_DIR=$HOME/Project/frp-docker
version=$(curl -s https://api.github.com/repos/fatedier/frp/releases/latest | grep "browser_download_url.*_linux_amd64.tar.gz" | cut -d '_' -f 4)
systemctl start docker
cd $work_DIR
curl -s https://api.github.com/repos/fatedier/frp/releases/latest | grep "browser_download_url.*_linux_amd64.tar.gz" | cut -d '"' -f 4 | wget -qi - && tar -xzf frp_*
cp frp_*/frps ./frps/
cp frp_*/frpc ./frpc/
docker build $work_DIR/frps -t zen8841/frps:$version
docker build $work_DIR/frpc -t zen8841/frpc:$version
docker image tag zen8841/frps:$version zen8841/frps:latest
docker image tag zen8841/frpc:$version zen8841/frpc:latest
docker push zen8841/frps:$version
docker push zen8841/frps:latest
docker push zen8841/frpc:$version
docker push zen8841/frpc:latest
docker image rm zen8841/frpc:latest zen8841/frpc:$version zen8841/frps:latest zen8841/frps:$version busybox
systemctl stop docker
rm -r frp_* frp?/frp*
