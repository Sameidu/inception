DATA_DIR=$(HOME)/data

start:
	mkdir -p $(DATA_DIR)/wp_data $(DATA_DIR)/mariadb_data
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up

daemon:
	mkdir -p $(DATA_DIR)/wp_data $(DATA_DIR)/mariadb_data
	docker compose -f srcs/docker-compose.yml up -d

stop:
	docker compose -f srcs/docker-compose.yml down

nginx:
	docker exec -it nginx sh

mariadb:
	docker exec -it mariadb sh

wordpress:
	docker exec -it wp sh

redis:
	docker exec -it redis sh

static:
	docker exec -it staticweb sh

portainer:
	docker exec -it portainer sh

adminer:
	docker exec -it adminer sh

sftp:
	docker exec -it sftp sh

clean:
	sudo rm -rf $(DATA_DIR)

fclean:	clean
	docker system prune -a --volumes -f 

re: fclean start
