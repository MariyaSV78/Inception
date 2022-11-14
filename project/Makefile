COMPOSE_FILE=./srcs/docker-compose.yml

all: up

up: 
	#sudo mkdir -p /home/msosnova/data/wordpress
	#sudo mkdir -p /home/msosnova/data/mysql
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down

clean: down
	docker system prune --all --force --volumes

fclean: clean
	sudo rm -rf /home/msosnova/data/*

re:	clean up

restart: 	
	docker stop $(docker ps -qa)\
	&& docker rm $(docker ps -qa)\ 
	&& docker rmi -f $(docker images -qa)\
	&& docker volume rm $(docker volume ls -q)\
	&& docker network rm $(docker network ls -q)

show:
	docker container ps -a

voume_show:
	cd /home/msosnova/data && ls -l **

volume_del:
	sudo rm -rf /home/msosnova/data/*


.PHONY: up down clean fclean re restart show volume_show volume_del
