FROM debian:buster

RUN apt-get update && apt-get upgrade && -y

RUN apt-get install wget php7.3 php-fpm php-mysql mariadb-client -y
RUN rm /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/script.sh ./
RUN chmod 755 ./script.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 755 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD ["./script.sh"]

#RUN		chown -R root:root /var/www/wordpress