#
# Builder
#

FROM docker.io/library/golang:alpine3.10

RUN apk add --update --no-cache \
    autoconf \
    automake \
    bash \
    btrfs-progs \
    btrfs-progs-dev \
    device-mapper \
    eudev-dev \
    gcc \
    git \
    clang \
    g++ \
    glib-static \
    go-md2man \
    gpgme-dev \
    iptables \
    libassuan-dev \
    libc-dev \
    libseccomp-dev \
    libselinux-dev \
    linux-headers \
    lvm2-dev \
    make \
    meson \
    musl-dev \
    ninja \
    openssl \
    ostree-dev \
    pkgconf \
    protobuf-c-dev \
    protobuf-dev

RUN mkdir /builder
WORKDIR /builder