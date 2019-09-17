#
# fuse-overlay
#

FROM otaviof/go-dev-sh:latest

ARG LIBFUSE_GIT_URL="https://github.com/libfuse/libfuse"
ARG LIBFUSE_VERSION="fuse-3.6.2"

ARG FUSEOVERLAYFS_GIT_URL="https://github.com/containers/fuse-overlayfs"
ARG FUSEOVERLAYFS_VERSION="v0.4.1"

RUN apt-get update && \
    apt-get install -y \
    dh-autoreconf \
    meson \
    libudev-dev \
    udev

RUN set -eux && \
    git clone --branch=${LIBFUSE_VERSION} ${LIBFUSE_GIT_URL} && \
    cd libfuse && \
    mkdir build && \
    cd build && \
    LDFLAGS="-lpthread" meson --prefix /usr/local -D default_library=static .. \
        || (cat /libfuse/build/meson-logs/meson-log.txt ; false) ; \
    sed -Ei '/^#include <err.h>/a #include <limits.h>' ../example/passthrough_hp.cc && \
    ninja && \
    ninja install && \
    fusermount3 -V

RUN set -eux && \
    git clone --branch ${FUSEOVERLAYFS_VERSION} ${FUSEOVERLAYFS_GIT_URL} && \
    cd fuse-overlayfs && \
    sh autogen.sh && \
    LIBS="-ldl" LDFLAGS="-static" ./configure --prefix /usr/local && \
    make && \
    make install && \
    fuse-overlayfs --help >/dev/null
