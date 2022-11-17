FROM alpine:3.15

ARG MDB_DATABASE \
	MDB_USER \
	MDB_PASS \
	MDB_ROOTPASS

RUN apk update && apk add --no-cache mariadb mariadb-client 

RUN mkdir /var/run/mysqld \
	&& chmod 777 /var/run/mysqld
	
COPY conf/mdb.cnf /etc/mysql/mariadb.conf.d/mdb.cnf

COPY tools/create_db.sh /usr/local/bin/

ENTRYPOINT ["/create_db.sh"]

EXPOSE 3306

#CMD [ "mysqld", "--bind-address=0.0.0.0"]

CMD ["mysqld_safe"]