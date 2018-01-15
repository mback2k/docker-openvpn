#!/bin/sh
set -e

# check environment variable OPENVPN_USER
if [ -z "${OPENVPN_USER}" ]; then
    echo "Environment variable OPENVPN_USER is required"
    exit 1
fi

# check environment variable OPENVPN_NETNAME
if [ -z "${OPENVPN_NETNAME}" ]; then
    echo "Environment variable OPENVPN_NETNAME is required"
    exit 2
fi

OPENVPN_KEYNAME=`dnssec-keygen -a HMAC-MD5 -b 512 -n USER ${OPENVPN_NETNAME}-nsupdate`

chown ${OPENVPN_USER} ${OPENVPN_KEYNAME}.private ${OPENVPN_KEYNAME}.key
chmod 600 ${OPENVPN_KEYNAME}.private
chmod 644 ${OPENVPN_KEYNAME}.key
