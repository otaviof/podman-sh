#
# Slirp4NetNS
#

FROM otaviof/builder

ARG SLIRP4NETNS_VERSION="v0.3.2"
ARG SLIRP4NETNS_GIT_URL="https://github.com/rootless-containers/slirp4netns.git"

RUN git clone --branch $SLIRP4NETNS_VERSION ${SLIRP4NETNS_GIT_URL} && \
    cd slirp4netns && \
    set -eux && \
    ./autogen.sh && \
    LDFLAGS=-static ./configure --prefix=/usr && \
    make
