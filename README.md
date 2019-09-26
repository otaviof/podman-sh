# `podman-sh`

Using `podman` and `buildah` on Mac is not technically possible, therefore users have been turning
back to create virtual-machines in order to have the full blown Linux experience. If you only need
to run `podman`/`buildah` as part of workflow, you could very well have a simple container which
contains the tooling necessary.

This repository is packing those tools in a single place and ships with a simple shell script to
spin up `podman-sh` container in the a practical way, mounting current directory inside. Images are
stored in [Docker-Hub][dockerhub] registry

Container is based on [`go-dev-sh`][go-dev-sh] base image, and therefore it able to build Go
projects.

## Usage

Simply run `podman-sh` in a given directory:

```bash
podman-sh
```

And use `--no-docker` to disable Docker socket being shared with the container:

```bash
podman-sh --no-docker
```

It will start a shell in the base container, mounting current directory on containers `/src`.
Additionally, the following local directories are mounted as well:

| Mount Point            | Local Directory        | Description                  |
|------------------------|------------------------|------------------------------|
| `/var/run/docker.sock` | `/var/run/docker.sock` | Optional, Docker socket      |
| `/go`                  | `~/.go-dev-sh/gopath`  | External `$GOPATH` directory |
| `~/.bash.d`            | `~/.go-dev-sh/bash.d`  | Shell history                |
| `~/.local`             | `~/.go-dev-sh/storage` | Podman storage directory     |

Those locations can be overwritten via environment variables used in `podman-sh`.

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
[go-dev-sh]: https://github.com/otaviof/go-dev-sh