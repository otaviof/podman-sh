#
# fuse-overlay
#

FROM otaviof/builder

ARG LIBFUSE_GIT_URL="https://github.com/libfuse/libfuse"
ARG LIBFUSE_VERSION="fuse-3.6.2"

ARG FUSEOVERLAYFS_GIT_URL="https://github.com/containers/fuse-overlayfs"
ARG FUSEOVERLAYFS_VERSION="v0.4.1"

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
    # [ "$(ldd /usr/bin/fuse-overlayfs | grep -Ev '^\s+ldd \(0x[0-9a-f]+\)$' | wc -l)" -eq 0 ] || \
    # (ldd /usr/bin/fuse-overlayfs ; false)

