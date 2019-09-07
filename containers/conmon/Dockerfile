#
# conmon
#

FROM otaviof/builder

ARG CONMON_VERSION="v2.0.0"
ARG CONMON_GIT_URL="https://github.com/containers/conmon.git"

RUN set -eux && \
    git clone --branch ${CONMON_VERSION} ${CONMON_GIT_URL} && \
    cd conmon && \
    make \
        PKG_CONFIG='pkg-config --static' \
        CFLAGS='-std=c99 -Os -Wall -Wextra -Werror -static' \
        LDFLAGS='-static' && \
    make podman && \
    /usr/local/libexec/podman/conmon --help >/dev/null
    # [ "$(ldd /usr/local/libexec/podman/conmon | grep -Ev '^\s+ldd \(0x[0-9a-f]+\)$' | wc -l)" -eq 0 ] || \
    #     (ldd /usr/local/libexec/podman/conmon ; false)
