NGINX 	= "nginx"
WORD 	= "wordpress"
DB 	= "mariadb"

.PHONY: all clean down fclean nginx re word

all:
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

edit:
	vim srcs/docker-compose.yml

ps:
	docker-compose -f ./srcs/docker-compose.yml ps

nginx:
	docker exec -it srcs_nginx_1 /bin/sh

word:
	docker run -it --rm --name $(WORD)IM $(WORD) /bin/sh

db:
	docker run -it --rm --name $(DB)IM $(DB) /bin/sh

down:
	docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	docker rmi $(NGINX)
	docker rmi $(WORD)
	docker rmi $(DB)

clean:
	docker system prune

re: fclean build
