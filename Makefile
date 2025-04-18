up:
	@if ! grep -q "manumart.42.fr" /etc/hosts; then \
		echo "Adding manumart.42.fr to /etc/hosts..."; \
		echo "127.0.0.1 manumart.42.fr" | sudo tee -a /etc/hosts > /dev/null; \
	fi
	@if [ ! -d "/home/manumart/data/web" ]; then \
		echo "Creating /home/manumart/data/web..."; \
		sudo mkdir -p /home/manumart/data/web; \
		sudo chown -R www-data:www-data /home/manumart/data/web; \
		sudo chmod -R 755 /home/manumart/data/web; \
	fi
	@if [ ! -d "/home/manumart/data/database" ]; then \
		echo "Creating /home/manumart/data/database..."; \
		sudo mkdir -p /home/manumart/data/database; \
		sudo chown -R www-data:www-data /home/manumart/data/database; \
		sudo chmod -R 755 /home/manumart/data/database; \
	fi
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down --volumes --remove-orphans

restart:
	make down
	make up

fclean:
	@echo "Stopping and removing all containers, volumes, and networks..."
	docker-compose -f srcs/docker-compose.yml stop
	docker-compose -f srcs/docker-compose.yml down --volumes --remove-orphans
	@echo "Deleting /home/manumart/data/web and /home/manumart/data/database..."
	sudo rm -rf /home/manumart/data/web
	sudo rm -rf /home/manumart/data/database
	@if [ "$(docker ps -qa)" ]; then docker stop $(docker ps -qa); docker rm $(docker ps -qa); fi
	@if [ "$(docker images -qa)" ]; then docker rmi -f $(docker images -qa); fi
	@if [ "$(docker volume ls -q)" ]; then docker volume rm $(docker volume ls -q); fi
	@if [ "$(docker network ls -q | grep -v 'bridge\|host\|none')" ]; then docker network rm $(docker network ls -q | grep -v 'bridge\|host\|none'); fi
	@echo "Cleanup complete."