#
# podman-sh
#

FROM otaviof/runc AS RUNC
FROM otaviof/podman AS PODMAN
FROM otaviof/conmon AS CONMON
FROM otaviof/cni-plugins AS CNIPLUGINS
FROM otaviof/fuse-overlay AS FUSEOVERLAY
FROM otaviof/slirp4netns AS SLIRP4NETNS
FROM otaviof/buildah AS BUILDAH

FROM otaviof/go-dev-sh:latest

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    iptables

COPY --from=RUNC /usr/local/bin/runc /usr/local/bin/runc
COPY --from=PODMAN /usr/local/bin/podman /usr/local/bin/podman
COPY --from=CONMON /usr/local/libexec/podman/conmon /usr/libexec/podman/conmon
COPY --from=CNIPLUGINS /usr/libexec/cni /usr/libexec/cni
COPY --from=FUSEOVERLAY /usr/local/bin/fuse-overlayfs /usr/local/bin/fuse-overlayfs
COPY --from=FUSEOVERLAY /usr/local/bin/fusermount3 /usr/local/bin/fusermount3
COPY --from=SLIRP4NETNS /src/slirp4netns/slirp4netns /usr/local/bin/slirp4netns
COPY --from=BUILDAH /usr/local/bin/buildah /usr/local/bin/buildah

RUN set -eux ; \
    mkdir -p -m 775 \
        /etc/containers \
        /etc/cni/net.d \
        /podman/.config/containers \
        /podman/.local/share/containers/storage/libpod

RUN set -eux ; \
    PODMAN_VERSION="$(podman --version |sed 's/podman version //')" ; \
    wget -O /etc/containers/registries.conf \
        https://raw.githubusercontent.com/projectatomic/registries/master/registries.fedora && \
    wget -O /etc/containers/policy.json \
        https://raw.githubusercontent.com/containers/skopeo/master/default-policy.json && \
    wget -O /etc/cni/net.d/99-bridge.conflist \
        https://raw.githubusercontent.com/containers/libpod/v$PODMAN_VERSION/cni/87-podman-bridge.conflist

RUN runc --help >/dev/null
RUN podman --help >/dev/null
RUN /usr/libexec/podman/conmon --help >/dev/null
RUN slirp4netns --help >/dev/null
RUN fuse-overlayfs --help >/dev/null

VOLUME /podman/.local/share/containers/storage