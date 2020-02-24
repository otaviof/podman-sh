FROM quay.io/buildah/upstream:latest

RUN dnf -y install dnf-plugins-core && \
	dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo && \
	yum -y install \
	git \
	make \
	docker-ce-cli \
	which \
	; \
	rm -rfv /var/cache /var/log/dnf* /var/log/yum.*

# https://bugzilla.redhat.com/show_bug.cgi?id=1600444
RUN yum install -y fedora-repos-rawhide && \
	yum install -y --nogpgcheck --allowerasing --enablerepo=rawhide golang ; \
	rm -rfv /var/cache /var/log/dnf* /var/log/yum.*

COPY bashrc /root/.bashrc
COPY profile /root/.profile
COPY storage.conf /etc/containers/storage.conf

VOLUME /var/lib/containers/storage