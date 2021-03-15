echo "Task 1: Perform apt-get update and upgrade"

apt-get update && apt-get upgrade -y

echo "Task 2: Enable Port Forwarding in Kernel"

sysctl net.ipv4.ip_forward=1 

echo "Task3: Grab the OpenVPN Simple Setup Script"

wget https://git.io/vpn -O openvpn-ubuntu-install.sh

echo "Task4: Change the Permissions of Setup Script"

chmod  +x openvpn-ubuntu-install.sh

echo "Modify Netplan to Avoid Going via Host"

cat <<EOT > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
    eth1:
      dhcp4: false
      addresses: [192.168.200.10/24]
    eth2:
      dhcp4: false
      addresses: [172.16.0.10/24]
EOT

