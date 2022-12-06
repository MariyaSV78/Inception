#!/bin/bash

# MDB_DATABASE=wordpress
# MDB_ROOT_PASS=rootpass
# MDB_ADMIN=msosnova
# MDB_PASS=pass

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld 
# chown -R mysql:mysql /var/run/mysqld/mysqld.sock 
# chown -R mysql:mysql /var/run/mysqld/mysqld.pid
# chmod -R 644 /var/run/mysqld/mysqld.sock
chmod -R 644 /etc/mysql/mariadb.conf.d/mdb.cnf

service mysql start

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASS}';\
CREATE DATABASE IF NOT EXISTS ${MDB_DATABASE};\
CREATE USER IF NOT EXISTS '${MDB_ADMIN}'@'%' IDENTIFIED BY '${MDB_PASS}';\
GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_ADMIN}'@'%';\
flush privileges;"

# 

#!/bin/bash
#echo -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PASS';\nCREATE DATABASE IF NOT EXISTS $MDB_DATABASE;\nCREATE USER IF NOT EXISTS $MDB_ADMIN@'%' IDENTIFIED BY '$MDB_PASS';\nGRANT ALL PRIVILEGES ON $MDB_DATABASE.* TO $MDB_ADMIN@'%';\n" > init.sql;
#exec "$@"




# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MDB_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${MDB_ADMIN}\`@'%' IDENTIFIED BY '${MDB_PASS}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${MDB_DATABASE}\`.* TO \`${MDB_ADMIN}\`@'%' IDENTIFIED BY '${MDB_PASS}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MDB_ROOT_PASS}';"
# mysql -u root -p${MDB_ROOT_PASS} -e "FLUSH PRIVILEGES;"