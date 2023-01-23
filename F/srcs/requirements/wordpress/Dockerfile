FROM debian:buster

RUN apt-get update -y 
RUN apt-get upgrade -y

RUN apt-get install wget php7.3 php-fpm php-mysql mariadb-client -y

RUN /etc/init.d/php7.3-fpm start
#COPY tools/php-fpm.conf /etc/php7/php-fpm.conf

RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/9000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p /var/www/html/ 
RUN chmod 777 /var/www/html/


COPY ./conf/auto_config.sh ./
RUN chmod 755 ./auto_config.sh

EXPOSE 9000

ENTRYPOINT ["./auto_config.sh"]
