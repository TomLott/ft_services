#!/bin/bash

rc default
/etc/init.d/mariadb setup
rc-service mariadb start


echo "CREATE DATABASE mydb;" | mysql
echo "GRANT ALL PRIVILEGES ON mydb.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql

mysql mydb < mydb.sql
rc-service mariadb stop
#https://www.opennet.ru/man.shtml?topic=rc-service&category=1&russian=0

/usr/bin/mysqld_safe
sh