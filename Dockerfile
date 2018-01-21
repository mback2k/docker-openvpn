FROM mback2k/debian:stretch-backports

MAINTAINER Marc Hoersken "info@marc-hoersken.de"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        net-tools dnsutils && \
    apt-get install -y --no-install-recommends \
        -t stretch-backports openvpn && \
    apt-get clean

RUN adduser --disabled-password --disabled-login --system --uid 1194 --home /etc/openvpn openvpn

EXPOSE 1194/tcp 1194/udp

VOLUME /etc/openvpn

ENV OPENVPN_USER=openvpn
ENV OPENVPN_NETNAME=

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/local/sbin/openvpn"]
