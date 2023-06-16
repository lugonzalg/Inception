COMPOSE=docker compose -f srcs/docker-compose.yml

.PHONY: all build down follow logs ps

all:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

build:
	$(COMPOSE) build --no-cache

logs:
	$(COMPOSE) logs

follow:
	$(COMPOSE) logs --follow

ps:
	$(COMPOSE) ps

edit:
	vim srcs/docker-compose.yml
