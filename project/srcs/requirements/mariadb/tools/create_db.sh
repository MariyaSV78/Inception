service mysql start 

mysql -e "CREATE DATABASE IF NOT EXISTS $MDB_DATABASE;" \

mysql -e "CREATE USER IF NOT EXISTS '$MDB_USER'@'%' IDENTIFIED by '$MDB_PASS';" \

mysql -e "GRANT ALL PRIVILEGES ON $MDB_DATABASE.* TO '$MDB_USER'@'%';" \

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '$MDB_ROOT_PASS';" \

mysql -u root -p$MDB_ROOT_PASS -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MDB_ROOT_PASS shutdown
