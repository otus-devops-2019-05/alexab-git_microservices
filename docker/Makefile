REGISTRY_HOST=docker.io
USER_NAME=xyzuser
BUILD_PATH='../src'
MON_PATH='../monitoring'

ui:
	@docker build -t $(USER_NAME)/ui -f $(BUILD_PATH)/ui/Dockerfile $(BUILD_PATH)/ui/

comment:
	@docker build -t $(USER_NAME)/comment -f $(BUILD_PATH)/comment/Dockerfile $(BUILD_PATH)/comment/

post-py:
	@docker build -t $(USER_NAME)/post-py -f $(BUILD_PATH)/post-py/Dockerfile $(BUILD_PATH)/post-py/

prom:
	@docker build -t $(USER_NAME)/prometheus -f $(MON_PATH)/prometheus/Dockerfile $(MON_PATH)/prometheus/


push-ui:
	@docker push  $(USER_NAME)/ui
push-comment:
	@docker push  $(USER_NAME)/comment
push-post-py:
	@docker push  $(USER_NAME)/post-py
push-prom:
	@docker push  $(USER_NAME)/prometheus


all: ui comment post-py prom
push-all:  push-ui push-comment push-post-py push-prom



