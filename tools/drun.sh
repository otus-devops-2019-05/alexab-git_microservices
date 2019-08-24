#!/bin/sh

NET_NAME_FRONT="front_net"
NET_FRONT="10.0.1.0/24"

NET_NAME_BACK="back_net"
NET_BACK="10.0.2.0/24"

DRIVER="bridge"

if [ -z $(docker network ls --filter name=^${NET_NAME_FRONT}$ --format="{{ .Name }}") ] ; then 
     docker network create $NET_NAME_FRONT --subnet=$NET_FRONT --driver $DRIVER;
fi

if [ -z $(docker network ls --filter name=^${NET_NAME_BACK}$ --format="{{ .Name }}") ] ; then 
     docker network create $NET_NAME_BACK --subnet=$NET_BACK --driver $DRIVER;
fi


docker run -d --network=$NET_NAME_BACK --network-alias=post_db --network-alias=comment_db --name mongo_db \
           -v reddit_db:/data/db mongo:latest
docker run -d --network=$NET_NAME_BACK --network-alias=post --name post xyzuser/post:1.0
docker run -d --network=$NET_NAME_BACK --network-alias=comment --name comment xyzuser/comment:1.0

docker run -d --network=$NET_NAME_FRONT -p 9292:9292 --name ui xyzuser/ui:2.0

docker network connect $NET_NAME_FRONT post
docker network connect $NET_NAME_FRONT comment

