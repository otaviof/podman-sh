#
# buildah
#

FROM otaviof/go-dev-sh:latest

ARG BUILDAH_VERSION="v1.10.1"
ARG BUILDAH_GIT_URL="https://github.com/containers/buildah.git"
ARG BUILDAH_REL_DIR="src/github.com/containers/buildah"

RUN apt-get update && \
    apt-get install -y \
    btrfs-progs \
    libbtrfs-dev \
    libdevmapper-dev \
    libgpgme-dev \
    libseccomp-dev

RUN set -eux && \
    git clone --branch ${BUILDAH_VERSION} ${BUILDAH_GIT_URL} ${GOPATH}/${BUILDAH_REL_DIR} && \
    cd ${GOPATH}/${BUILDAH_REL_DIR} && \
    make && \
    mv -v buildah /usr/local/bin/buildah

