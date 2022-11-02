all:
	docker compose -f ./srcs/docker-compose.yml up -d --build

build:
	docker compose -f ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune --all --force --volumes

fclean: clean
	sudo rm -rf /home/okushnir/data/mariadb/*
	# sudo rm -rf /home/okushnir/data/mariadb/.*
	sudo rm -rf /home/okushnir/data/wordpress/*

ps:
	docker compose -f ./srcs/docker-compose.yml ps