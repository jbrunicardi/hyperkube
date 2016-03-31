FROM quay.io/coreos/hyperkube:v1.1.8_coreos.0

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get -yy -q \
    install \
    nfs-common \
    && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y \
    && DEBIAN_FRONTEND=noninteractive apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nfs-common /etc/default/nfs-common

COPY run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "-c", "/run.sh", ";"]