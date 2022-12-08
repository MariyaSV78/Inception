FROM debian:buster

ARG MDB_DATABASE \
	MDB_ADMIN \
	MDB_PASS \
	MDB_ROOT_PASS

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir /var/run/mysqld 
RUN chmod 777 /var/run/mysqld
#RUN chown -R mysql:mysql /var/run/mysqld
	
COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

#COPY /tools/create_db.sh /create_db.sh
#RUN chmod 755 create_db.sh

RUN chmod -R 644 /etc/mysql/mariadb.conf.d/mdb.cnf
# RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

RUN service mysql start \
&& mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DATABASE};" \
&& mysql -e "CREATE USER IF NOT EXISTS '${MDB_ADMIN}'@'%' IDENTIFIED BY '${MDB_PASS}';"\
&& mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_ADMIN}'@'%';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MDB_ROOT_PASS}'; FLUSH PRIVILEGES;"
# && chmod -R 644 /var/run/mysqld/mysqld.sock \
# && chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
# && chown -R mysql:mysql /var/run/mysqld/mysqld.pid \


EXPOSE 3306

# ENTRYPOINT ["/create_db.sh"]

# CMD ["mysqld", "--bind-address=0.0.0.0"]
CMD ["mysqld_safe"]

# CMD ["/usr/bin/mysqld", "--skip-log-error"]
#[ "mysqld", "--bind-address=0.0.0.0", "--init-file=/init.sql"]

