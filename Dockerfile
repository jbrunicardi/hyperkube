FROM quay.io/coreos/hyperkube:v1.4.6_coreos.0
MAINTAINER Jaime Brunicardi <jbrunicardi@gmail.com>

COPY glusterfs-common_3.12.15-1_amd64.deb /tmp/glusterfs-common_3.12.15-1_amd64.deb
COPY glusterfs-client_3.12.15-1_amd64.deb /tmp/glusterfs-client_3.12.15-1_amd64.deb

RUN set -x \
    && apt-get update \
    && apt-get install -y liburcu2 python-prettytable \
    && dpkg -i /tmp/glusterfs-common_3.12.15-1_amd64.deb \
    && dpkg -i /tmp/glusterfs-client_3.12.15-1_amd64.deb \
    && apt-get autoremove --yes \
    && apt-get clean