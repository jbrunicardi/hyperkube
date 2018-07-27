FROM quay.io/coreos/hyperkube:v1.4.6_coreos.0
MAINTAINER Jaime Brunicardi <jbrunicardi@gmail.com>

COPY glusterfs-client_3.10.1-1_amd64.deb /tmp/glusterfs-client_3.10.1-1_amd64.deb

RUN set -x \
    && dpkg -i /tmp/glusterfs-client_3.10.1-1_amd64.deb \
    && apt-get autoremove --yes \
    && apt-get clean