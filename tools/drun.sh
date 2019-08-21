#!/bin/sh
NET_NAME="reddit-stage"
docker network create $NET_NAME
docker run -d --network=$NET_NAME --network-alias=post_db --network-alias=comment_db mongo:latest
docker run -d --network=$NET_NAME --network-alias=post xyzuser/post:1.0
docker run -d --network=$NET_NAME --network-alias=comment xyzuser/comment:1.0
docker run -d --network=$NET_NAME -p 9292:9292 xyzuser/ui:1.0
