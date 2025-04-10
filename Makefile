up:
	@if [ ! -d "/home/manumart/Desktop/maneleh42/inception/data/web" ]; then \
	echo "Creating /home/manumart/Desktop/maneleh42/inception/data/web..."; \
	sudo mkdir -p /home/manumart/Desktop/maneleh42/inception/data/web; \
	sudo chown -R www-data:www-data /home/manumart/Desktop/maneleh42/inception/data/web; \
	sudo chmod -R 755 /home/manumart/Desktop/maneleh42/inception/data/web; \
	fi
	@if [ ! -d "/home/manumart/Desktop/maneleh42/inception/data/database" ]; then \
	echo "Creating /home/manumart/Desktop/maneleh42/inception/data/database..."; \
	sudo mkdir -p /home/manumart/Desktop/maneleh42/inception/data/database; \
	sudo chown -R www-data:www-data /home/manumart/Desktop/maneleh42/inception/data/database; \
	sudo chmod -R 755 /home/manumart/Desktop/maneleh42/inception/data/database; \
	fi
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down --volumes --remove-orphans

restart:
	make down
	make up