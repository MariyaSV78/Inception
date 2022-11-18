#!/bin/bash

echo -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';\nCREATE DATABASE IF NOT EXISTS $MDB_DATABASE;\nCREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$MDB_PASS';\nGRANT ALL PRIVILEGES ON $MDB_DATABASE.* TO $MDB_USER@'%';\n" > init.sql;

exec "$@"



# # service mysql start 
# /etc/init.d/mysql start

# mysql -e "CREATE DATABASE IF NOT EXISTS $MDB_DATABASE;" \

# mysql -e "CREATE USER IF NOT EXISTS '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASS';" \

# mysql -e "GRANT ALL PRIVILEGES ON $MDB_DATABASE.* TO '$MDB_USER'@'%';" \

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '$MDB_ROOT_PASS';" \

# mysql -u root -p$MDB_ROOT_PASS -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p$MDB_ROOT_PASS shutdown
