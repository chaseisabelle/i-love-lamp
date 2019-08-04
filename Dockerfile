FROM ubuntu:latest
MAINTAINER chase <adogthatcantalk@gmail.com>

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:ondrej/php
RUN apt-get upgrade -y
RUN apt-get install -y zip unzip
RUN apt-get install -y \
	php7.3 \
	php7.3-cgi \
	php7.3-cli \
	php7.3-common \
	php7.3-curl \
	php7.3-json \
	php7.3-mysql \
	php7.3-zip

RUN apt-get install -y curl
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer
RUN curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig
# Make sure we're installing what we think we're installing!
RUN php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot
RUN rm -f /tmp/composer-setup.*

# this looks kinda stupid, but it works...will figure out anomolies later
RUN apt-get update
RUN apt-get install apache2 libapache2-mod-php7.3 -y
RUN apt-get update

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

ENV TERM dumb

RUN a2enmod rewrite

EXPOSE 80

CMD bash -c "apachectl -D FOREGROUND"
