# Image will be built from
FROM	alpine:3.15

#Update and install nginx 
RUN	apk update && apk upgrade && apk add --no-cache \
	nginx \ 
	openssl

# Create the file that will host the SSL key
RUN	mkdir -p  /etc/nginx/ssl

#Generate a self certificate
RUN	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
		-out /etc/nginx/ssl/msosnova.42.fr.crt \
		-keyout /etc/nginx/ssl/msosnova.42.fr.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42 School/CN=msosnova.42.fr/UID=msosnova"

# Configurer nginx
RUN mkdir -p /var/www/html
RUN	chmod 755 /var/www/html 

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

#Open the port
EXPOSE	443

#Run the configuration
ENTRYPOINT ["nginx", "-g", "daemon off;"]
