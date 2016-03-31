FROM quay.io/coreos/hyperkube:v1.1.8_coreos.0

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get -yy -q \
    install \
    nfs-common \
    && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y \
    && DEBIAN_FRONTEND=noninteractive apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nfs-common /etc/default/nfs-common

RUN ln -s /etc/init.d/rpcbind /etc/rc2.d/S03rpcbind
RUN ln -s /etc/init.d/rpcbind /etc/rc3.d/S03rpcbind
RUN ln -s /etc/init.d/rpcbind /etc/rc4.d/S03rpcbind
RUN ln -s /etc/init.d/rpcbind /etc/rc5.d/S03rpcbind

RUN update-rc.d rpcbind defaults