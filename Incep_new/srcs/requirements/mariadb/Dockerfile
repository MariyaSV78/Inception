FROM debian:buster
 
ARG MDB_DATABASE \
	MDB_USER \
	MDB_PASS \
	MDB_ROOT_PASS

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir /var/run/mysqld 
RUN chmod 777 /var/run/mysqld
	
COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

RUN chmod -R 644 /etc/mysql/mariadb.conf.d/mdb.cnf

RUN service mysql start \
&& mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DATABASE};" \
&& mysql -e "CREATE USER IF NOT EXISTS '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASS}';"\
&& mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_USER}'@'%';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MDB_ROOT_PASS}'; FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mysqld_safe"]

