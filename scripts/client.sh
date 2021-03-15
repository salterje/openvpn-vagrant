echo "Task 1: Perform apt-get update and upgrade"

apt-get update && apt-get upgrade -y

echo "Task 2: Modify Netplan to Add Static Routes"

cat <<EOT > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
    eth1:
      dhcp4: false
      addresses: [192.168.200.11/24]
      routes:
      - to: 172.16.0.0/24
        via: 192.168.200.10
EOT

echo "Task 2B: Apply the Netplan"

netplan apply 

echo "Install openvpn"

sudo apt install -y openvpn 

