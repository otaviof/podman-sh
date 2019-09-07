#
# runc
#

FROM otaviof/builder

ARG RUNC_VERSION="v1.0.0-rc8"
ARG RUNC_GIT_URL="https://github.com/opencontainers/runc.git"
ARG RUNC_REL_DIR="src/github.com/opencontainers/runc"

RUN set -eux && \
    git clone --branch ${RUNC_VERSION} ${RUNC_GIT_URL} ${GOPATH}/${RUNC_REL_DIR} && \
    cd ${GOPATH}/${RUNC_REL_DIR} && \
    make static BUILDTAGS='seccomp selinux ambient' && \
    mv -v runc /usr/local/bin/runc && \
    rm -rfv $GOPATH/${RUNC_REL_DIR}} && \
    [ "$(ldd /usr/local/bin/runc | wc -l)" -eq 0 ] || (ldd /usr/local/bin/runc; false)
