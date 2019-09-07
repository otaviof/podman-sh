# `podman-sh`

Using `podman` and `buildah` on Mac is not technically possible, therefore users have been turning
back to create virtual-machines in other to have the full blown Linux experience. If you only need
to run `podman`/`buildah` as part of workflow, you could very well have a simple container which
contains the tooling necessary.

This repository is packing those tools in a single container and ships with a simple shell script to
spin up `podman-sh` container in the a practical way, mounting current directory inside. Images are
stored in [Docker-Hub][dockerhub] registry

## Usage

Simply run `podman-sh` in a given directory:


```
$ podman-sh
```

It will start a shell in the base container, mounting current directory on containers `/src`.
Additionally, the following local directories are mounted as well:

- `~/.podman/.bash.d`: holds bash history file, subsequent `podman-sh` runs should keep the same
  shell history;
- `~/.podman/containers/storage`: Podman storage directory;

## Building

In order to build the container run:

```bash
make build
```

To install `podman-sh` in `/usr/local/bin`, run:

```bash
make install
```

[dockerhub]: https://hub.docker.com/r/otaviof/podman-sh