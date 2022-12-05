FROM alpine:3.15

ARG MDB_DATABASE \
	MDB_ADMIN \
	MDB_PASS \
	MDB_ROOT_PASS

RUN apk update && apk add --no-cache mariadb mariadb-client 

RUN mkdir /var/run/mysqld 
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld
	
COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

COPY /tools/create_db.sh .
RUN chmod 755 /usr/local/bin/create_db.sh

ENTRYPOINT ["/create_db.sh"]

EXPOSE 3306

CMD ["mysqld_safe"]



# CMD ["/usr/bin/mysqld", "--skip-log-error"]
#[ "mysqld", "--bind-address=0.0.0.0", "--init-file=/init.sql"]

