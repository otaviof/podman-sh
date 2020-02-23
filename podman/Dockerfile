FROM quay.io/podman/stable:latest

# docker community repository and docker client
RUN dnf -y install dnf-plugins-core && \
	dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

RUN yum -y install \
	git \
	make \
	buildah \
	docker-ce-cli \
	which \
	; \
	rm -rf /var/cache /var/log/dnf* /var/log/yum.*

# https://bugzilla.redhat.com/show_bug.cgi?id=1746364
RUN echo "systemd.unified_cgroup_hierarchy=0" > /etc/sysctl.d/podman.conf

# https://bugzilla.redhat.com/show_bug.cgi?id=1600444
RUN yum install -y fedora-repos-rawhide && \
	yum install -y --nogpgcheck --allowerasing --enablerepo=rawhide golang

COPY bashrc /root/.bashrc
COPY profile /root/.profile
COPY storage.conf /etc/containers/storage.conf

VOLUME /var/lib/containers/storage