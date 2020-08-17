#!/bin/bash

setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
dnf clean all
dnf -y install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-agent
dnf -y install mariadb-server && systemctl start mariadb && systemctl enable mariadb
## secure mysql 
