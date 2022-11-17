COMPOSE_FILE=./srcs/docker-compose.yml

all: up

up:
	cd srcs && sudo service docker restart \
	&& docker-compose -f docker-compose.yml build \
	&& docker-compose -f docker-compose.yml up -d

down:
	cd srcs && docker-compose -f docker-compose.yml down

clean:
	cd srcs && docker-compose -f docker-compose.yml down \
	&& docker system prune --force

fclean:
	cd srcs && docker-compose -f docker-compose.yml down \
	&& docker system prune --force \
	&& docker network prune --force \
	&& docker volume prune --force\
	&& sudo rm -rf /home/msosnova/data/*

re:	clean up

restart:
	docker stop `docker ps -qa`
	docker rm `docker ps -a -q`
	docker rmi -f `docker images -qa`
	docker volume rm `docker volume ls -q`
	#docker network rm `docker network ls -q`

list:
	docker container ps -a

list_volumes: 
	docker volume ls



#-------------------------------------------------------------------------

up_nginx:
	cd srcs && sudo docker-compose up --build nginx
up_mariadb:
	cd srcs && sudo docker-compose up --build mariadb
up_wordpress:
	cd srcs && sudo docker-compose up --build wordpress
#-----------------------------------------------------------------------

voume_show:
	cd /home/msosnova/data && ls -l **

volume_del:
	sudo rm -rf /home/msosnova/data/*


.PHONY: up down clean fclean re list list_volumes nginx mariadb wordpress \
	up_nginx up_mariadb up_wordpress  volume_show volume_del

#sudo mkdir -p /home/msosnova/data/wordpress
#sudo mkdir -p /home/msosnova/data/mysql
