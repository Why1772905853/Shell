#!/bin/bash
#PXE
#by Why
rpm -qa httpd || yum -y install httpd #装包
rpm -qa tftp-server || yum -y install tftp-server #装包
rpm -qa dhcp || yum -y install dhcp #装包
systemctl restart httpd dhcpd tftp #启动服务
systemctl enable httpd  dhcpd tftp #设置开机自启
mkdir /var/www/html/dvd #建挂载点


# DHCP Server Configuration file.
#   see /usr/share/doc/dhcp*/dhcpd.conf.example
#   see dhcpd.conf(5) man page
subnet 192.168.4.0 netmask 255.255.255.0 {
  range 192.168.4.100 192.168.4.200;
  option domain-name-servers 192.168.4.7;
  option routers 192.168.4.254;
  default-lease-time 600;
  max-lease-time 7200;
} 

