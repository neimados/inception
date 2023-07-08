COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml
LOCAL_VOLUME_DB = /home/dso/data/mariadb
LOCAL_VOLUME_WP = /home/dso/data/wordpress

all: up

up:
	mkdir -p $(LOCAL_VOLUME_DB)
	mkdir -p $(LOCAL_VOLUME_WP)
	bash -c "echo '127.0.0.1       dso.42.fr' >> /etc/hosts"
	cp /home/dso/inception/.env	./srcs
	$(COMPOSE) -f $(COMPOSE_FILE) up --build

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down --remove-orphans --volumes

clean:
	$(COMPOSE) -f $(COMPOSE_FILE) down --remove-orphans --rmi all --volumes

fclean: clean
	@ docker image prune --force
	@ docker network prune --force
	@ docker volume prune --force
	rm -rf $(LOCAL_VOLUME_DB)/*
	rm -rf $(LOCAL_VOLUME_WP)/*

re: fclean all
.PHONY: all down clean fclean re