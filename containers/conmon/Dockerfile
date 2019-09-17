#
# conmon
#

FROM otaviof/go-dev-sh:latest

ARG CONMON_VERSION="v2.0.0"
ARG CONMON_GIT_URL="https://github.com/containers/conmon.git"

RUN apt-get update && \
    apt-get install -y \
    libglib2.0-dev

RUN set -eux && \
    git clone --branch ${CONMON_VERSION} ${CONMON_GIT_URL} && \
    cd conmon && \
    make \
        PKG_CONFIG='pkg-config --static' \
        CFLAGS='-std=c99 -Os -Wall -Wextra -Werror -static' \
        LDFLAGS='-static' && \
    make podman && \
    /usr/local/libexec/podman/conmon --help >/dev/null