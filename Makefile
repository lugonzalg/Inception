NGINX 	= "nginx"
WORD 	= "wordpress"
DB 	= "mariadb"

.PHONY: build nginx clean fclean kill re

build:
	docker build /home/lukas/Inception/srcs/requirements/nginx -t $(NGINX)
	docker build /home/lukas/Inception/srcs/requirements/wordpress -t $(WORD)
	docker build /home/lukas/Inception/srcs/requirements/mariadb -t $(DB)

nginx:
	docker run -it --name nginxIM $(NGINX)

word:
	docker run -it --name wordIM $(WORD)

run:
	docker run -d --name nginxIM $(NGINX)
	docker run -d --name wordIM $(WORD)
	docker run -d --name mariaIM $(DB)

kill:
	docker kill $(NGNIX)
	docker kill $(WORD)
	docker kill $(DB)

fclean: clean
	docker rmi $(NGINX)
	docker rmi $(WORD)
	docker rmi $(DB)

clean:
	docker system prune

re: fclean build
