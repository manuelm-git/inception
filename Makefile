up:
	docker-compose -f docker-compose.yml up -d --build

down:
	docker-compose -f docker-compose.yml down --volumes --remove-orphans

restart:
	make down
	make up