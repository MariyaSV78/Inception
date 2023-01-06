NAME=Inception

all: up

up:
	@printf "Building configuration ${NAME}...\n"
	@sudo service docker restart 
	@sudo mkdir -p /home/msosnova/data/wordpress
	@sudo mkdir -p /home/msosnova/data/mariadb
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
	&& docker system prune -af \
	&& sudo rm -rf /home/msosnova/data/* \
	&& docker volume rm -f `docker volume ls -q`

re:	clean up

stop:
	docker stop `docker ps -aq`

list:
	docker ps

volumes: 
	docker volume ls

enter_nginx:
	cd srcs && sudo docker container exec -it nginx ls

enter_mariadb:
	cd srcs && sudo docker container exec -it mariadb bash -l

enter_wordpress:
	cd srcs && sudo docker container exec -it wordpress bash -l

volume_show:
	cd ~/data && sudo ls -l **

volume_del:
	sudo rm -rf ~/data/*


.PHONY: up down clean fclean re stop list volumes \
	enter_nginx enter_mariadb enter_wordpress volume_show volume_del