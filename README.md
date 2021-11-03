# frpc-docker
A simple [frp](https://github.com/fatedier/frp) client docker image

GitHub [zen8841/frp-docker](https://github.com/zen8841/frp-docker)

Docker [zen8841/frps](https://hub.docker.com/r/zen8841/frps)

Docker [zen8841/frpc](https://hub.docker.com/r/zen8841/frpc)
## Usage
docker cli:
```shell
# frps
docker run \
	-v /path/to/frps.ini:/etc/frps.ini \
	-p #what port you want to expose \
	zen8841/frps
#frpc
docker run \
	-v /path/to/frpc.ini:/etc/frpc.ini \
	zen8841/frpc
```
You can put frps/frpc into same folder as Dockerfile to build your own frps/frpc docker image
