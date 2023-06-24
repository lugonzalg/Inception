COMPOSE=docker compose -f srcs/docker-compose.yml
MKDIR=mkdir -p
RM=rm -rf
HOME=/Users/lugonzal

.PHONY: all build down follow logs ps clean

all:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

build:
	$(MKDIR) $(HOME)/data
	$(MKDIR) $(HOME)/data/mariadb
	$(MKDIR) $(HOME)/data/wordpress
	$(COMPOSE) build --no-cache

refresh:
	$(COMPOSE) build

logs:
	$(COMPOSE) logs

follow:
	$(COMPOSE) logs --follow

ps:
	$(COMPOSE) ps

edit:
	vim srcs/docker-compose.yml

clean:
	sudo $(RM) $(HOME)/data
