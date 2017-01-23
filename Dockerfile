FROM debian:jessie 
MAINTAINER Alexander Krupenkin <mail@akru.me>
LABEL Description="Cloud IPFS node" Vendor="Airalab" Version="0.1"

ADD http://dist.ipfs.io/go-ipfs/v0.4.4/go-ipfs_v0.4.4_linux-amd64.tar.gz /go-ipfs.tar.gz 
RUN tar xf go-ipfs.tar.gz && cd go-ipfs && ./install.sh
RUN rm -rf go-ipfs*

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4001 5001 80
VOLUME ["/ipfs"]
