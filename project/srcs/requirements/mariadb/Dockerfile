FROM alpine:3.15

ARG MDB_DATABASE \
	MDB_USER \
	MDB_PASS \
	MDB_ROOT_PASS

RUN apk update && apk add --no-cache mariadb mariadb-client 

RUN mkdir /var/run/mysqld 
# && chown -R mysql:mysql /var/run/mysqld \
RUN chmod 777 /var/run/mysqld
	
COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

RUN systemctl start mysql

RUN service mysql start \
&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.pid \
&& chmod -R 644 /var/run/mysqld/mysqld.sock \
&& mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DATABASE};" \
&& mysql -e "CREATE USER IF NOT EXISTS '${MDB_USER}'@'%' IDENTIFIED by '${MDB_PASS}';" \
&& mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_USER}'@'%';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MDB_ROOT_PASS}';" \
&& mysql -u root -p${MDB_ROOT_PASS} -e "FLUSH PRIVILEGES;"

# ENTRYPOINT ["./create_db.sh"]

EXPOSE 3306

CMD ["mysqld_safe"]



# CMD ["/usr/bin/mysqld", "--skip-log-error"]
#[ "mysqld", "--bind-address=0.0.0.0", "--init-file=/init.sql"]

# COPY ./tools/create_db.sh /usr/local/bin/
# RUN chmod 755 /usr/local/bin/create_db.sh