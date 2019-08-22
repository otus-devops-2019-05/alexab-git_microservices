#!/bin/sh
NET_NAME="reddit"

if [ -z $(docker network ls --filter name=^${NET_NAME}$ --format="{{ .Name }}") ] ; then 
     docker network create $NET_NAME ; 
fi

docker run -d --network=$NET_NAME --network-alias=post_db1 --network-alias=comment_db1 -v reddit_db:/data/db mongo:latest

docker run -d --network=$NET_NAME -e POST_DATABASE_HOST='post_db1' \
              --network-alias=post1 xyzuser/post:1.0
  
docker run -d --network=$NET_NAME -e COMMENT_DATABASE_HOST='comment_db1' \
              --network-alias=comment1 xyzuser/comment:1.0

docker run -d --network=$NET_NAME -e POST_SERVICE_HOST='post1' -e COMMENT_SERVICE_HOST='comment1' \
           -p 9292:9292 xyzuser/ui:2.0
