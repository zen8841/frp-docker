FROM alpine:latest
MAINTAINER zen8841 <zen.8841@gmail.com>
RUN apk add --update --no-cache curl wget && \
curl -s https://api.github.com/repos/fatedier/frp/releases/latest | \
grep "browser_download_url.*_linux_amd64.tar.gz" | \
cut -d '"' -f 4 | \
wget -qi - && \
tar -xzf frp* && \
mv /frp*/frpc /bin && \
rm -r /frp* && \
apk del --no-cache curl wget
ENTRYPOINT ["/bin/frpc", "-c", "/etc/frpc.ini"]
