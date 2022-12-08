# Image will be built from
FROM	alpine:3.15

#Update and install nginx 
RUN	apk update && apk upgrade && apk add --no-cache nginx 
RUN	apk add --update openssl && rm -rf /var/cache/apk/*

# Create the file that will host the SSL key
RUN	mkdir -p  /etc/nginx/ssl

#Generate a self certificate
RUN	openssl req -x509 -nodes\
		-out /etc/nginx/ssl/msosnova.42.fr.crt \
		-keyout /etc/nginx/ssl/msosnova.42.fr.key \
		-subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=msosnova.42.fr/UID=msosnova"

# Create a folder that will be used to store all my nginx config files
RUN mkdir -p /var/run/nginx

#Copy the new configuration inside nginx
COPY	./conf/nginx.conf /etc/nginx/nginx.conf
# COPY	./conf/nginx.conf /etc/nginx/http.d/nginx.conf

# Assured access to the folder where the site will be contained
RUN mkdir -p /var/www/html 
RUN chmod 755 /var/www/html 
#RUN chown -R www-data:www-data /var/www/html

#Open the port
EXPOSE	443

#Run the configuration
CMD	["nginx", "-g", "daemon off;"]
