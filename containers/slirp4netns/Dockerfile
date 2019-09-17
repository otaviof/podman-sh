#
# Slirp4NetNS
#

FROM otaviof/go-dev-sh:latest

ARG SLIRP4NETNS_VERSION="v0.3.2"
ARG SLIRP4NETNS_GIT_URL="https://github.com/rootless-containers/slirp4netns.git"

RUN apt-get update && \
    apt-get install -y \
    dh-autoreconf \
    libglib2.0-dev

RUN set -eux && \
    git clone --branch $SLIRP4NETNS_VERSION ${SLIRP4NETNS_GIT_URL} && \
    cd slirp4netns && \
    ./autogen.sh && \
    LDFLAGS=-static ./configure --prefix=/usr && \
    make
