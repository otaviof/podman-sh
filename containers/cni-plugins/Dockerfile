#
# CNI Plugins
#

FROM otaviof/go-dev-sh:latest

ARG CNI_VERSION="v0.7.5"
ARG CNI_GIT_URL="https://github.com/containernetworking/plugins.git"
ARG CNI_REL_DIR="src/github.com/containernetworking/plugins"
ARG CNI_REPO_PATH="github.com/containernetworking/plugins"

RUN set -eux && \
    git clone --branch ${CNI_VERSION} ${CNI_GIT_URL} ${GOPATH}/${CNI_REL_DIR} && \
    cd ${GOPATH}/${CNI_REL_DIR} && \
    PLUGINS="plugins/meta/* plugins/main/* plugins/ipam/* plugins/sample" ; \
    for d in ${PLUGINS} ; do \
        if [ -d "$d" ] ; then \
            plugin="$(basename "$d")" ; \
            CGO_ENABLED=0 go build \
                -o /usr/libexec/cni/${plugin} \
                -ldflags "-s -w -extldflags '-static'" ${CNI_REPO_PATH}/${d} \
                || exit 1 ; \
        fi \
    done


