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
    fuse3 \
    iptables \
    libgpgme11 \
    libdevmapper1.02.1 \
    sudo \
    uidmap

COPY --from=RUNC /usr/local/bin/runc /usr/local/bin/runc
COPY --from=PODMAN /usr/local/bin/podman /usr/local/bin/podman
COPY --from=CONMON /usr/local/libexec/podman/conmon /usr/libexec/podman/conmon
COPY --from=CNIPLUGINS /usr/libexec/cni /usr/libexec/cni
COPY --from=FUSEOVERLAY /usr/local/bin/fuse-overlayfs /usr/local/bin/fuse-overlayfs
COPY --from=FUSEOVERLAY /usr/local/bin/fusermount3 /usr/local/bin/fusermount3
COPY --from=SLIRP4NETNS /src/slirp4netns/slirp4netns /usr/local/bin/slirp4netns
COPY --from=BUILDAH /usr/local/bin/buildah /usr/local/bin/buildah

RUN set -eux && \
    runc --help >/dev/null && \
    podman --help >/dev/null && \
    buildah --help >/dev/null && \
    /usr/libexec/podman/conmon --help >/dev/null && \
    slirp4netns --help >/dev/null && \
    fuse-overlayfs --help >/dev/null

COPY sudoers /etc/sudoers

RUN set -x && \
    addgroup --system --gid 100000 podman && \
    adduser --system --disabled-password --uid 100000 --shell /bin/bash --home /podman --ingroup podman podman && \
    echo 'podman:100001:65536' > /etc/subuid && \
    echo 'podman:100001:65536' > /etc/subgid && \
    mkdir -p -m 775 \
        /etc/containers \
        /etc/cni/net.d \
        /podman/.config/containers \
        /podman/.local/share/containers/storage/libpod && \
    cp -v /root/.inputrc /podman && \
    chown -R podman:podman /podman

COPY profile /podman/.profile
COPY registries.conf /etc/containers/registries.conf
COPY policy.json /etc/containers/policy.json
COPY 99-bridge.conflist /etc/cni/net.d/99-bridge.conflist

COPY run-delve.sh /usr/local/bin/run-delve.sh
RUN chmod +x /usr/local/bin/run-delve.sh

VOLUME /go
VOLUME /podman/.bash.d
VOLUME /podman/.local/share/containers/storage

EXPOSE 40000

USER podman
