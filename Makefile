IMAGE_TAG ?= "otaviof/podman-sh:latest"
SCRIPT ?= podman-sh
INSTALL_DIR ?= /usr/local/bin/

default: build

build:
	docker build --tag "$(IMAGE_TAG)" .

install:
	install -m 755 "$(SCRIPT)" "$(INSTALL_DIR)"

push: build
	docker push "$(IMAGE_TAG)"
