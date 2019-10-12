<p align="center">
	<a alt="Docker-Cloud Build Status" href="https://hub.docker.com/r/otaviof/podman-sh">
		<img alt="Docker-Cloud Build Status" src="https://img.shields.io/docker/cloud/build/otaviof/podman-sh.svg">
	</a>
</p>

# `podman-sh`

Composes a development workspace with `podman`, `buildah` and Golang, with scripting around to make
it easy to spin it up against a project directory. This container can also be used in
[`.devcontainer.json`][devcontainer] for VScode remote development.

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

| Mount Point            | Local Directory        | Description                      |
|------------------------|------------------------|----------------------------------|
| `~/.bash.d`            | `~/.podman/bash.d`     | Shell history, and settings      |
| `/var/lib/containers`  | `~/.podman/storage`    | Podman storage directory         |
| `/var/run/containers`  | `~/.podman/runtime`    | Podman runtime storage directory |
| `/var/run/docker.sock` | `/var/run/docker.sock` | Optional, Docker socket          |

## Building

In order to build the container run:

```bash
make build
```

To install `podman-sh` in `/usr/local/bin`, run:

```bash
make install
```

[devcontainer]: https://code.visualstudio.com/docs/remote/containers#_creating-a-devcontainerjson-file
