COMPOSE= docker-compose -f srcs/docker-compose.yml

.PHONY: all build nginx nginx-build nginx-in nginx-edit nginx-down nginx-logs nginx-logf edit ps

all: nginx

build: nginx-build

down: nginx-down

nginx:
	$(COMPOSE) up -d nginx

nginx-build:
	$(COMPOSE) build nginx

nginx-in:
	$(COMPOSE) exec nginx sh

nginx-edit:
	vim srcs/requirements/nginx/Dockerfile

nginx-down:
	$(COMPOSE) down 

nginx-logs:
	$(COMPOSE) logs

nginx-logf:
	$(COMPOSE) logs --follow

nginx-edit:
	vim srcs/requirements/nginx/config/nginx.conf

ps:
	$(COMPOSE) ps

edit:
	vim srcs/docker-compose.yml
