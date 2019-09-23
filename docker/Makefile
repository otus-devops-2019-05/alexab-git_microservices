REGISTRY_HOST=docker.io
USER_NAME=xyzuser
BUILD_PATH='../src'
MON_PATH='../monitoring'

ui:
	@docker build -t $(USER_NAME)/ui -f $(BUILD_PATH)/ui/Dockerfile $(BUILD_PATH)/ui/

comment:
	@docker build -t $(USER_NAME)/comment -f $(BUILD_PATH)/comment/Dockerfile $(BUILD_PATH)/comment/

post:
	@docker build -t $(USER_NAME)/post -f $(BUILD_PATH)/post-py/Dockerfile $(BUILD_PATH)/post-py/

prom:
	@docker build -t $(USER_NAME)/prometheus -f $(MON_PATH)/prometheus/Dockerfile $(MON_PATH)/prometheus/

telegraf:
	@docker build -t $(USER_NAME)/telegraf -f $(MON_PATH)/telegraf/Dockerfile $(MON_PATH)/telegraf/

grafana:
	@docker build -t $(USER_NAME)/grafana -f $(MON_PATH)/grafana/Dockerfile $(MON_PATH)/grafana/

trickster:
	@docker build -t $(USER_NAME)/trickster -f $(MON_PATH)/trickster/Dockerfile $(MON_PATH)/trickster/

alertmanager:
	@docker build -t $(USER_NAME)/alertmanager -f $(MON_PATH)/alertmanager/Dockerfile $(MON_PATH)/alertmanager/



push-ui:
	@docker push  $(USER_NAME)/ui
push-comment:
	@docker push  $(USER_NAME)/comment
push-post:
	@docker push  $(USER_NAME)/post
push-prom:
	@docker push  $(USER_NAME)/prometheus
push-telegraf:
	@docker push  $(USER_NAME)/telegraf
push-grafana:
	@docker push  $(USER_NAME)/grafana
push-alertmanager:
	@docker push  $(USER_NAME)/alertmanager
push-trickster:
	@docker push  $(USER_NAME)/trickster



all: ui comment post prom alertmanager telegraf grafana trickster
push-all:  push-ui push-comment push-post push-prom push-alertmanager push-telegraf push-trickster push-grafana


