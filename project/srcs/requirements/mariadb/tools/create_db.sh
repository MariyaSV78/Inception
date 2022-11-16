service mysql start 

mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DATABASE};" \

mysql -e "CREATE USER IF NOT EXISTS '${MDB_ADMIN}'@'%' IDENTIFIED by '${MDB_MDP}';" \

mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_ADMIN}'@'%';" \

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MDB_ROOT_MDP}';" \

mysql -u root -p${MDB_ROOT_MDP} -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown