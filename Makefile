NGINX 	= "nginx"
WORD 	= "wordpress"
DB 	= "mariadb"

.PHONY: build nginx clean fclean kill re

all:
	docker-compose up -d

nginx:
	docker run -it --rm --name nginxIM -p 80:80 -p 443:443 $(NGINX)

word:
	docker run -it --rm --name wordIM $(WORD)

kill:
	docker-compose down

fclean: clean
	docker rmi $(NGINX)
	docker rmi $(WORD)
	docker rmi $(DB)

clean:
	docker system prune

re: fclean build
