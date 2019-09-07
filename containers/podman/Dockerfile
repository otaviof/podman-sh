#
# Podman
#

FROM otaviof/builder

ARG PODMAN_VERSION="v1.5.1"
ARG PODMAN_REL_DIR="src/github.com/containers/libpod"
ARG PODMAN_GIT_URL="https://github.com/containers/libpod.git"

RUN set -eux && \
    git clone --branch ${PODMAN_VERSION} ${PODMAN_GIT_URL} ${GOPATH}/${PODMAN_REL_DIR} && \
    cd ${GOPATH}/${PODMAN_REL_DIR} && \
    make install.tools && \
    # patching MUSL (https://github.com/containers/libpod/issues/3284)
    sed -i '/#include <stdlib.h>/a#include <sys/types.h>' pkg/rootless/rootless_linux.go && \
    cat pkg/rootless/rootless_linux.go |head -n 30 && \
    set -eux ; \
    make \
        LDFLAGS="-s -w -extldflags '-static'" \
        BUILDTAGS='seccomp selinux varlink exclude_graphdriver_devicemapper containers_image_ostree_stub containers_image_openpgp' && \
    mv -v bin/podman /usr/local/bin/podman && \
    [ "$(ldd /usr/local/bin/podman | wc -l)" -eq 0 ] || (ldd /usr/local/bin/podman; false)

