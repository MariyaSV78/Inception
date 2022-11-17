FROM alpine:3.15

ARG MDB_DATABASE \
	MDB_USER \
	MDB_PASS \
	MDB_ROOTPASS

RUN apk update && apk add --no-cache mariadb mariadb-client 

RUN mkdir /var/run/mysqld \
	&& chmod 777 /var/run/mysqld
	
COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

#COPY tools/create_db.sh /usr/local/bin/

#ENTRYPOINT ["/create_db.sh"]
RUN service mysql start \
&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.pid \
&& chmod -R 644 /var/run/mysqld/mysqld.sock \
&& mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DATABASE};" \
&& mysql -e "CREATE USER IF NOT EXISTS '${MDB_ADMIN}'@'%' IDENTIFIED by '${MDB_MDP}';" \
&& mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_ADMIN}'@'%';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MDB_ROOT_MDP}';" \
&& mysql -u root -p${MDB_ROOT_MDP} -e "FLUSH PRIVILEGES;"

EXPOSE 3306

#CMD [ "mysqld", "--bind-address=0.0.0.0"]

CMD ["mysqld_safe"]