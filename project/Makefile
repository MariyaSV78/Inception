COMPOSE_FILE=./srcs/docker-compose.yml
NAME=Inception

all: up

up:
	@printf "Building configuration ${NAME}...\n"
	@sudo service docker restart 
	@sudo mkdir -p ~/data/wordpress
	@sudo mkdir -p ~/data/mariadb
# @sudo chmod 777 -R /var/lib/docker/volumes
	@cd srcs \
	&& docker-compose -f docker-compose.yml build \
	&& docker-compose -f docker-compose.yml up -d

down:
	@printf "Stopping configuration ${NAME}...\n"
	@cd srcs && docker-compose -f docker-compose.yml down

clean:
	@printf "Cleaning configuration ${NAME}...\n"	
	@cd srcs && docker-compose -f docker-compose.yml down \
	&& docker system prune --force

fclean:
	@printf "Total clean of all configurations docker\n"
	@cd srcs && docker-compose -f docker-compose.yml down \
	&& docker system prune --force \
	&& docker network prune --force \
	&& docker volume prune --force\
	&& sudo rm -rf ~/data/*

re:	clean up

stop:
	@docker stop `docker ps -aq`

restart:
	@docker rm `docker ps -aq`
	@docker rmi -f `docker images -aq`
	@docker volume rm `docker volume ls -q`
	@docker network rm `docker network ls -q`


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

volume_show:
	cd ~/data && sudo ls -l **

volume_del:
	sudo rm -rf ~/data/*


.PHONY: up down clean fclean re stop restart list list_volumes nup_ginx up_mariadb up_wordpress \
	volume_show volume_del

#sudo mkdir -p /home/msosnova/data/wordpress
#sudo mkdir -p /home/msosnova/data/mysql
