FROM debian:buster

ARG MDB_DATABASE \
	MDB_ADMIN \
	MDB_PASS \
	MDB_ROOT_PASS

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir /var/run/mysqld 
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld
	
COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

COPY /tools/create_db.sh /create_db.sh
RUN chmod 755 create_db.sh

EXPOSE 3306

ENTRYPOINT ["/create_db.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]



# CMD ["/usr/bin/mysqld", "--skip-log-error"]
#[ "mysqld", "--bind-address=0.0.0.0", "--init-file=/init.sql"]

