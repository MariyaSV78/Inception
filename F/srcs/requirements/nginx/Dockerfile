FROM	debian:buster

# UPDATE ANS INSTALL NGINX && OPENSSL
RUN	apt-get update && \
	apt-get install -y nginx \
			vim \
			curl \
			openssl 

# DIRECTORY TO SAVE THE SSL KEY && CERTIFICATE 
RUN 	mkdir -p /etc/nginx/ssl

# GENERATING SSL CERTIFICATE
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/fboumell.42.fr.crt -keyout /etc/nginx/ssl/fboumell.42.fr.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=fboumell.42.fr/UID=fboumell"

# DIRECTORY TO SAVE ALL THE NGINX CONFIG FILES
RUN	mkdir -p /var/run/nginx

# TO MAKE SURE TO HAVE THE RIGHTS NEEDED
# principal root 
RUN	chmod 775 /var/www/html
# principal user
RUN	chown -R www-data:www-data /var/www/html

# COPY OUR CONFIG FILE TO REPLACE NGINX CONFIG FILE
COPY	conf/nginx1.conf /etc/nginx/conf.d/nginx.conf

# CONNEXION HTTPS ON PORT 443
EXPOSE	443

# TO LAUNCH NGINX AND MAKING SURE THAT THE CONTAINER DOES NOT STOP
CMD	["nginx", "-g", "daemon off;"]

