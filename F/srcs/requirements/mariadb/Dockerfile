FROM	debian:buster

ARG SQL_DATABASE \
	SQL_USER \
	SQL_PASSWORD \
	SQL_ROOT_PASSWORD

# UPDATE AND INSTALL MARIADB
RUN	apt-get update -y 
RUN	apt-get upgrade -y 
RUN	apt-get install -y mariadb-server

# COPY OUR CONFIG FILE TO REPLACE MARIADB CONFIG FILE
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod -R 644 /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN	mkdir -p /script

# COPY THE SCRIPT TO CREATE THE DATABASE AND THE USER INTO THE CONTAINER
# COPY tools/script_mariadb.sh script/script_mariadb.sh

RUN mkdir -p /var/run/mysqld 
	# chown -R mysql:mysql /var/run/mysqld && \
RUN chmod 777 /var/run/mysqld 
# 		/script/script_mariadb.sh && \
# 	mysql_install_db


RUN service mysql start \
&& mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" \
&& mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"\
&& mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${SQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

EXPOSE	3306

CMD ["mysqld_safe"]

# ENTRYPOINT ["bash", "/script/script_mariadb.sh"]

