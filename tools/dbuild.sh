#!/bin/sh
docker build -t xyzuser/post:1.0 ./src/post-py
docker build -t xyzuser/comment:1.0 ./src/comment
docker build -t xyzuser/ui:1.0 ./src/ui
