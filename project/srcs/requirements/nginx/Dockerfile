# our image will be built from
FROM	alpine:3.16

#Update and install nginx 
RUN	apk update && apk upgrade && apk add --no-cache nginx 

#Generate a self certificate
#RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
#       -out /etc/nginx/ssl/msosnova.42.fr.ctr\
#	-keyout /etc/nginx/ssl/msosnova.42.fr.key\
#	-subj "/C=FR/ST=Paris/L=Paris/0=42 School/OU=msosnova/CN=msosnova.42.fr"

#Open the port
EXPOSE	443

#Copy the new configuration inside nginx
COPY	conf/nginx.conf /etc/nginx/conf.d
COPY	tools/ /etc/nginx/ssl/

#Run the configuration
CMD	["nginx", "-g", "deamon off;"]
