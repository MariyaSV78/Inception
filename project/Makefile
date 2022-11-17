COMPOSE_FILE=./srcs/docker-compose.yml

all: up

up: 
	cd srcs && sudo service docker restart \
	&& docker-compose -f $(COMPOSE_FILE) build \
	&& docker-compose -f $(COMPOSE_FILE) up -d

down:
	cd srcs && docker-compose -f $(COMPOSE_FILE) down

clean:
	cd srcs && docker-compose -f $(COMPOSE_FILE) down \
	&& docker system prune --force

fclean: clean
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf /home/msosnova/data/*

re:	clean up

#restart: 	
#	docker stop $(docker ps -qa)\
#	&& docker rm $(docker ps -qa)\ 
#	&& docker rmi -f $(docker images -qa)\
	&& docker volume rm $(docker volume ls -q)\
	&& docker network rm $(docker network ls -q)

show:
	docker container ps -a



#-------------------------------------------------------------------------
nginx:
	docker exec -it nginx bash -l

mariadb:
	docker exec -it mariadb bash -l

wordpress:
	docker exec -it wordpress bash -l

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


.PHONY: up down clean fclean re show nginx mariadb wordpress \
	up_nginx up_mariadb up_wordpress  volume_show volume_del

#sudo mkdir -p /home/msosnova/data/wordpress
#sudo mkdir -p /home/msosnova/data/mysql