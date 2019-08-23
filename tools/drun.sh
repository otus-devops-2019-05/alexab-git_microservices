#!/bin/sh
NET_NAME="reddit"

if [ -z $(docker network ls --filter name=^${NET_NAME}$ --format="{{ .Name }}") ] ; then 
     docker network create $NET_NAME ; 
fi

docker run -d --network=$NET_NAME --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --network=$NET_NAME --network-alias=post xyzuser/post:1.0
docker run -d --network=$NET_NAME --network-alias=comment xyzuser/comment:1.0
docker run -d --network=$NET_NAME -p 9292:9292 xyzuser/ui:2.0
