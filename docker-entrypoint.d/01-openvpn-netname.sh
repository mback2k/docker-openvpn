#!/bin/sh
set -e

# check environment variable OPENVPN_USER
if [ -z "${OPENVPN_USER}" ]; then
    echo "Environment variable OPENVPN_USER is required"
    exit 1
fi

# check environment variable OPENVPN_GROUP
if [ -z "${OPENVPN_GROUP}" ]; then
    echo "Environment variable OPENVPN_GROUP is required"
    exit 2
fi

# check environment variable OPENVPN_NETNAME
if [ -z "${OPENVPN_NETNAME}" ]; then
    echo "Environment variable OPENVPN_NETNAME is required"
    exit 3
fi

echo "#!/bin/sh" > /usr/local/sbin/openvpn
echo "exec /usr/sbin/openvpn --user ${OPENVPN_USER} --group ${OPENVPN_GROUP} --cd /etc/openvpn --config /etc/openvpn/${OPENVPN_NETNAME}.conf" >> /usr/local/sbin/openvpn

chown --reference=/usr/sbin/openvpn /usr/local/sbin/openvpn
chmod --reference=/usr/sbin/openvpn /usr/local/sbin/openvpn

exit 0
