NGINX 	= "nginx"
WORD 	= "wordpress"
DB 	= "mariadb"

.PHONY: build nginx clean fclean kill re

build:
	docker build ./srcs/requirements/nginx -t $(NGINX)
	docker build ./srcs/requirements/wordpress -t $(WORD)
	docker build ./srcs/requirements/mariadb -t $(DB)

nginx:
	docker run -it --rm --name nginxIM -p 80:80 -p 443:443 $(NGINX)

word:
	docker run -it --rm --name wordIM $(WORD)

run:
	docker run -d --rm --name nginxIM -p 443:443 -p 80:80 $(NGINX)
	docker run -d --rm --name wordIM $(WORD)
	docker run -d --rm --name mariaIM $(DB)

kill:
	docker kill nginxIM
	docker kill wordIM
	docker kill mariaIM

fclean: clean
	docker rmi $(NGINX)
	docker rmi $(WORD)
	docker rmi $(DB)

clean:
	docker system prune

re: fclean build
