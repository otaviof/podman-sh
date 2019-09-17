#
# buildah
#

FROM otaviof/go-dev-sh:latest

ARG BUILDAH_REPO="github.com/containers/buildah"
ARG BUILDAH_REL_DIR="src/github.com/containers/buildah"

RUN apt-get update && \
    apt-get install -y \
    libdevmapper-dev \
    libgpgme-dev \
    libseccomp-dev

RUN set -eux && \
    go get -u -d ${BUILDAH_REPO} && \
    cd ${GOPATH}/${BUILDAH_REL_DIR} && \
    make && \
    mv -v buildah /usr/local/bin/buildah

