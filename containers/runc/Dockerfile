#
# runc
#

FROM otaviof/go-dev-sh:latest

ARG RUNC_VERSION="v1.0.0-rc8"
ARG RUNC_GIT_URL="https://github.com/opencontainers/runc.git"
ARG RUNC_REL_DIR="src/github.com/opencontainers/runc"

RUN apt-get update && \
    apt-get install -y \
    libseccomp-dev

RUN set -eux && \
    git clone --branch ${RUNC_VERSION} ${RUNC_GIT_URL} ${GOPATH}/${RUNC_REL_DIR} && \
    cd ${GOPATH}/${RUNC_REL_DIR} && \
    make static BUILDTAGS='seccomp selinux ambient' && \
    mv -v runc /usr/local/bin/runc
