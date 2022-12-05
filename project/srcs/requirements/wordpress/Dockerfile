FROM debian:buster

RUN apt-get update -y 
RUN apt-get upgrade -y

RUN apt-get install wget php7.3 php-fpm php-mysql mariadb-client -y
#RUN rm /etc/php/7.3/fpm/pool.d/www.conf
RUN /etc/init.d/php7.3-fpm start

RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/9000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p /var/www
#COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/wp-config.sh ./
RUN chmod 755 ./wp-config.sh

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod 755 wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT ["./wp-config.sh"]

#CMD [ "php-fpm7.3", "--nodaemonize" ]

#RUN		chown -R root:root /var/www/wordpress