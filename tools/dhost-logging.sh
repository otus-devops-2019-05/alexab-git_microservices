#!/bin/bash
docker-machine rm logging
docker-machine create --driver google \
 --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
 --google-machine-type n1-standard-1 \
 --google-open-port 5601/tcp \
 --google-open-port 9292/tcp \
 --google-open-port 9411/tcp \
 --google-zone europe-west4-b  logging
