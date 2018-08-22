# Get network interfac name
SUBNET=172.16.0
IPADDR=${SUBNET}.2

NET_INT=`ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2a;getline}'`
echo ${NET_INT}
# output -- enp0s3

NET_CONFIG="/etc/sysconfig/network-scripts/ifcfg-${NET_INT}"
NET_CONFIG_NEW=${NET_CONFIG}.new
cp ${NET_CONFIG} ${NET_CONFIG}.bak

awk '{gsub("dhcp","static",$1);}' > /etc/sysconfig/network-scripts/ifcfg-${NET_INT}.new


echo "IPADDR=${IPADDR}" > ${NET_CONFIG_NEW}
echo "NETMASK=255.255.255.0" >> ${NET_CONFIG_NEW}
echo "GATEWAY=${SUBNET}.1" >> ${NET_CONFIG_NEW}
echo "DNS1=1.0.0.1" >> ${NET_CONFIG_NEW}
echo "DNS2=1.1.1.1" >> ${NET_CONFIG_NEW}
echo "DNS3=8.8.4.4" >> ${NET_CONFIG_NEW}

