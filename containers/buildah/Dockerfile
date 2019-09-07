#
# buildah
#

FROM otaviof/builder

ARG BUILDAH_VERSION="v1.10.1"
ARG BUILDAH_GIT_URL="https://github.com/containers/buildah.git"
ARG BUILDAH_REL_DIR="src/github.com/containers/buildah"

RUN set -eux && \
    git clone --branch ${BUILDAH_VERSION} ${BUILDAH_GIT_URL} ${GOPATH}/${BUILDAH_REL_DIR} && \
    cd ${GOPATH}/${BUILDAH_REL_DIR} && \
    make static && \
    mv -v buildah.static /usr/local/bin/buildah

