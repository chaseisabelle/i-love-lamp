rm: 
	make stop
	echo y | docker-compose rm

stop:
	docker-compose stop

up:
	docker-compose up -d
	docker-compose exec website chown -R www-data:www-data /var/website/www
	make composer
	make curl
	make ps

rmi:
	make rm
	docker rmi -f website/latest
	docker rmi -f mysql/mysql-server

build:
	docker build -t website/latest .
	docker build -t mysql/mysql-server .

rebuild:
	make rmi
	make build

reup:
	make stop
	make up

ps:
	docker-compose ps

logs:
	docker-compose logs -f

log:
	tail -f log/*

curl:
	curl -v http://localhost

composer:
	docker-compose exec -w /var/website website composer install

mulligan:
	make rebuild
	make up
