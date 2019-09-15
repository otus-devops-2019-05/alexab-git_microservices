#!/bin/bash

IMAGE='https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts'
TAGS='http,https'
DISK_SIZE='60'
MACHINE_TYPE='n1-standard-1'
ZONE='europe-west4-b'
NAME='docker-host'
GIT_COMPOSE_DIR='gitlab'

if [ ! -d "$PWD/$GIT_COMPOSE_DIR" ]; then
  echo "Error. Please, create directory $GIT_COMPOSE_DIR"
#  exit
fi

docker-machine create --driver google \
 --google-machine-image $IMAGE \
 --google-disk-size $DISK_SIZE \
 --google-zone $ZONE \
 --google-tags $TAGS \
 --google-machine-type $MACHINE_TYPE $NAME

if [ $? -eq 0 ]; then
  eval $(docker-machine env $NAME)
  docker-machine ssh $NAME sudo mkdir -p /srv/gitlab/config /srv/gitlab/data /srv/gitlab/logs 
  wget https://gist.githubusercontent.com/Nklya/c2ca40a128758e2dc2244beb09caebe1/raw/e9ba646b06a597734f8dfc0789aae79bc43a7242/docker-compose.yml -O $PWD/$GIT_COMPOSE_DIR/docker-compose.yml

  DOCKER_HOST_IP=$(docker-machine ip $NAME)
  sed -i -e 's/<YOUR-VM-IP>/'"$DOCKER_HOST_IP"'/g' $PWD/$GIT_COMPOSE_DIR/docker-compose.yml

else
    echo "Docker machine create return code was not zero"
fi

