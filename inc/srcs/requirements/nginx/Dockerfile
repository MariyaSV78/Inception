FROM alpine:3.15

LABEL maintainer="msosnova.42.student.fr"

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY conf/ /etc/nginx/http.d/
COPY tools/ /etc/nginx/ssl/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 