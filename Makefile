COMPOSE=docker compose -f srcs/docker-compose.yml
MKDIR=mkdir -p
RM=rm -rf

.PHONY: all build clean down follow logs ps re rebuild restart

all:
	$(COMPOSE) up -d mariadb wordpress nginx

bonus:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

build:
	$(MKDIR) $(HOME)/data
	$(MKDIR) $(HOME)/data/mariadb
	$(MKDIR) $(HOME)/data/wordpress
	$(MKDIR) $(HOME)/data/redis
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

re: down clean build all follow

rebuild: down refresh all follow

restart: down all follow
