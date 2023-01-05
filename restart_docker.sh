#!/bin/bash

CONTAINERS=`docker ps -aq`
IMAGES=`docker images -aq`
VOLUMES=`docker volume ls -q`
NETWORKS=`docker network ls -q`

 
if [ -z "$CONTAINERS" ]
then
	echo "==== No CONTAINERS to stop and clear ===="
else
	echo "==== Stop CONTAINERS ===="
	docker stop $CONTAINERS
	echo "Clear CONTAINERS"
	docker rm $CONTAINERS
fi

if [ -z "$IMAGES" ]
then
	echo "==== No IMAGES to clear ===="
else
	echo "==== Clear IMAGES ===="
	docker rmi -f $IMAGES
fi

if [ -z "$VOLUMES" ]
then
	echo "==== No VOLUMES to clear ===="
else
	echo "==== Clear VOLUMES ===="
	docker volume rm $VOLUMES
fi

# if [ -z "$NETWORKS" ]
# then
# 	echo "==== No NETWORKS to clear ===="
# else
# 	echo "==== Clear NETWORKS ===="
# 	docker network rm $NETWORKS
# fi
	
sudo service docker restart
