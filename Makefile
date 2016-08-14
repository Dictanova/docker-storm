DOCKER := docker build
NAME := dictanova/docker-storm
VER := 1.0.2

common:
	$(DOCKER) -t $(NAME):$(VER) storm/

ui: common
	$(DOCKER) -t $(NAME):$(VER)-ui storm-ui/

supervisor: common
	$(DOCKER) -t $(NAME):$(VER)-supervisor storm-supervisor/

nimbus: common
	$(DOCKER) -t $(NAME):$(VER)-nimbus storm-nimbus/

all: nimbus supervisor ui
