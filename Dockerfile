FROM quay.io/podman/stable:latest

RUN yum -y install \
	git \
	make \
	buildah \
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