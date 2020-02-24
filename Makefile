IMAGE_TAG_BUILDAH ?= "otaviof/buildah-sh:latest"
IMAGE_TAG_PODMAN ?= "otaviof/podman-sh:latest"
SCRIPT ?= podman-sh
INSTALL_DIR ?= /usr/local/bin/

default: build

build: buildah podman

buildah:
	docker build --tag="$(IMAGE_TAG_BUILDAH)" --file="buildah/Dockerfile" .

podman:
	docker build --tag="$(IMAGE_TAG_PODMAN)" --file="podman/Dockerfile" .

install:
	install -m 755 "$(SCRIPT)" "$(INSTALL_DIR)"


push-buildah-sh:
	docker push "$(IMAGE_TAG_BUILDAH)"

push-podman-sh:
	docker push "$(IMAGE_TAG_PODMAN)"

push: build push-buildah-sh push-podman-sh
