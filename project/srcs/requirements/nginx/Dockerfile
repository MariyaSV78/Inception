# our image will be built from
FROM	alpine:3.16

#Update and install nginx 
RUN	apk update && apk upgrade && apk add --no-cache nginx 
RUN	apk add --update openssl && rm -rf /var/cache/apk/*

RUN	mkdir  /etc/nginx/ssl

#Generate a self certificate
RUN	openssl req -x509 -nodes\
		-out /etc/nginx/ssl/msosnova.42.fr.ctr\
		-keyout /etc/nginx/ssl/msosnova.42.fr.key\
		-subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=msosnova.42.fr/UID=msosnova"

RUN mkdir -p /var/run/nginx
#Open the port
EXPOSE	443

#Copy the new configuration inside nginx
COPY	./conf/nginx.conf /etc/nginx/nginx.conf

#Run the configuration
CMD	["nginx", "-g", "daemon off;"]
