IMAGE_TAG ?= "otaviof/podman-sh:latest"

BUILDER_IMAGE_TAG ?= "otaviof/builder:latest"
RUNC_IMAGE_TAG ?= "otaviof/runc:latest"
PODMAN_IMAGE_TAG ?= "otaviof/podman:latest"
CONMON_IMAGE_TAG ?= "otaviof/conmon:latest"
CNI_PLUGINS_IMAGE_TAG ?= "otaviof/cni-plugins:latest"
SLIRP4NETNS_IMAGE_TAG ?= "otaviof/slirp4netns:latest"
FUSE_OVERLAY_IMAGE_TAG ?= "otaviof/fuse-overlay:latest"
BUILDAH_IMAGE_TAG ?= "otaviof/buildah:latest"

default: build

build-deps: \
	build-builder \
	build-runc \
	build-podman \
	build-conmon \
	build-cni-plugins \
	build-slirp4netns \
	build-fuse-overlay \
	build-buildah

build: \
	build-deps \
	build-podman-sh

build-builder:
	docker build --tag "$(BUILDER_IMAGE_TAG)" \
		--file containers/builder/Dockerfile \
		containers/builder

build-runc:
	docker build --tag "$(RUNC_IMAGE_TAG)" \
		--file containers/runc/Dockerfile \
		containers/runc

build-podman:
	docker build --tag "$(PODMAN_IMAGE_TAG)" \
		--file containers/podman/Dockerfile \
		containers/podman

build-conmon:
	docker build --tag "$(CONMON_IMAGE_TAG)" \
		--file containers/conmon/Dockerfile \
		containers/conmon

build-cni-plugins:
	docker build --tag "$(CNI_PLUGINS_IMAGE_TAG)" \
		--file containers/cni-plugins/Dockerfile \
		containers/cni-plugins

build-slirp4netns:
	docker build --tag "$(SLIRP4NETNS_IMAGE_TAG)" \
		--file containers/slirp4netns/Dockerfile \
		containers/slirp4netns

build-fuse-overlay:
	docker build --tag "$(FUSE_OVERLAY_IMAGE_TAG)" \
		--file containers/fuse-overlay/Dockerfile \
		containers/fuse-overlay

build-buildah:
	docker build --tag "$(BUILDAH_IMAGE_TAG)" \
		--file containers/buildah/Dockerfile \
		containers/buildah

build-podman-sh:
	docker build --tag "$(IMAGE_TAG)" \
		--file containers/podman-sh/Dockerfile \
		containers/podman-sh

install:
	install -m 755 podman-sh /usr/local/bin/

clean:
	docker rmi \
		$(BUILDER_IMAGE_TAG) \
		$(RUNC_IMAGE_TAG) \
		$(PODMAN_IMAGE_TAG) \
		$(CONMON_IMAGE_TAG) \
		$(CNI_PLUGINS_IMAGE_TAG) \
		$(SLIRP4NETNS_IMAGE_TAG) \
		$(FUSE_OVERLAY_IMAGE_TAG) \
		$(BUILDAH_IMAGE_TAG)