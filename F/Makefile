all:	up

#---------------------------- UP -------------------------------#
# -f = specify the location of a Compose configuation file
# up = builds, (re)creates, starts 
# -d = run containers in the background
# --build = build images before starting containers
#---------------------------------------------------------------#
up:
	sudo mkdir -p /home/${USER}/data/mariadb
	sudo mkdir -p /home/${USER}/data/wordpress
	sudo docker compose -f srcs/docker-compose.yml up -d --build


#-------------------------- PS -----------------------------#
# Lists containers for a Compose project, with current status 
# and exposed ports. By default, both running and stopped 
# containers are shown
#-----------------------------------------------------------#
ps:
	sudo docker compose -f srcs/docker-compose.yml ps


#------------------------- DOWN ---------------------------#
# Stop containers and removes containers, networks, volumes
# and images created by up
#----------------------------------------------------------#
down:
	sudo docker compose -f srcs/docker-compose.yml down


#----------------------- CLEAN -----------------------#
# DOWN + remove all unused containers, networks, images
# (both dangling and unreferenced), and optionnally,
# volumes.
# -a = remove all unused images not just dangling ones
# --force = do not prompt for confirmation
#-----------------------------------------------------#
clean :	down
	sudo docker system prune -a --force


fclean: clean
	sudo rm -Rf /home/${USER}/data/mariadb
	sudo rm -Rf /home/${USER}/data/wordpress
	sudo docker volume rm -f `docker volume ls -q`

re : fclean up


#------------------ EXEC -------------------#
# Execute an interactive bash on the container
#-------------------------------------------#
nginx :
	sudo docker exec -it nginx bash -l

mariadb :
	sudo docker exec -it mariadb bash -l

wordpress :
	sudo docker exec -it wordpress bash -l


#------------- LOGS --------------#
# Display log output from services
#--------------------------------#
logs :
	sudo docker logs nginx
	sudo docker logs mariadb
	sudo docker logs wordpress


.PHONY:	all up ps down clean fclean re nginx mariadb wordpress logs
