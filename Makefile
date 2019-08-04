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

build:
	docker build -t website/latest .

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
