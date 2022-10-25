NGINX 	= "nginx"
WORD 	= "wordpress"
DB 	= "mariadb"

COMPOSE=docker-compose -f ./srcs/docker-compose.yml 

.PHONY: all clean down fclean nginx re word

all:
	$(COMPOSE) up -d

build:
	$(COMPOSE) up --build -d

edit:
	vim srcs/docker-compose.yml

ps:
	$(COMPOSE) ps

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
