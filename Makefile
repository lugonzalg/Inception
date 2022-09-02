NGINX 	= "nginx"

.PHONY: build nginx clean fclean kill re

build:
	docker build /home/lukas/Inception/srcs/requirements/nginx -t $(NGINX)

nginx:
	docker run -it --rm --name nginxIM $(NGINX)

kill:
	docker kill nginxIM

clean:
	docker system prune

fclean: clean
	docker rmi $(NGNIX)

re: fclean build
