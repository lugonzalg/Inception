<<<<<<< HEAD
COMPOSE=docker compose -f srcs/docker-compose.yml
MKDIR=mkdir -p
RM=rm -rf

.PHONY: all build down follow logs ps clean
=======
NGINX 	= "nginx"
WORD 	= "wordpress"
DB 	= "mariadb"

COMPOSE=docker-compose -f ./srcs/docker-compose.yml 

.PHONY: all clean down fclean nginx re word
>>>>>>> origin

all:
	$(COMPOSE) up -d

<<<<<<< HEAD
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
=======
build:
	$(COMPOSE) up --build -d

edit:
	vim srcs/docker-compose.yml
>>>>>>> origin

ps:
	$(COMPOSE) ps

<<<<<<< HEAD
edit:
	vim srcs/docker-compose.yml

clean:
	sudo $(RM) $(HOME)/data
=======
nginx:
	$(COMPOSE) exec $(NGINX) /bin/sh
	#docker exec -it srcs_nginx_1 /bin/sh

word:
	$(COMPOSE) exec $(WORD) /bin/sh
	#docker run -it --rm --name $(WORD)IM $(WORD) /bin/sh

db:
	$(COMPOSE) exec $(DB) /bin/sh
	#docker run -it --rm --name $(DB)IM $(DB) /bin/sh

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs

fclean: clean
	docker rmi $(NGINX)
	docker rmi $(WORD)
	docker rmi $(DB)

clean:
	docker system prune

re: fclean build
>>>>>>> origin
