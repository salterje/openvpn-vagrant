echo "Task 1: Perform apt-get update and upgrade"

apt-get update && apt-get upgrade -y

echo "Task 2: Install nginx and start it up"

apt-get -y install nginx
apt-get install htop
systemctl start nginx
systemctl enable nginx 



echo "Task 3: Modify Netplan to Add Static Routes"

cat <<EOT > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: true
    eth1:
      dhcp4: false
      addresses: [172.16.0.20/24]
      routes:
      - to: 192.168.200.0/24
        via: 172.16.0.10
EOT

echo "Task 3B: Apply the Netplan"

netplan apply 


