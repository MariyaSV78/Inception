#!/bin/sh

# LAUNCH MYSQL
service mysql start;

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
service mysql start;

# CREATE DATABASE (IF IT DOES NOT EXIST)
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

# CREATE USER (IF IT DOES NOT EXIST)
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# USER PRIVILEGES
mysql -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}' IDENTIFIED BY '${SQL_PASSWORD}';"

# CHANGE ROOT PRIVILEGES
mysql -u root -p$SQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# RELOAD DATA_BASE (this way modifications for user root are taken into account)
mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# SHUTDOWN MYSQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe



