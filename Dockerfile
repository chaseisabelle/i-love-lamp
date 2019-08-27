###################################################
# build from ubuntu latest - live life on the edge
###################################################
FROM ubuntu:latest
MAINTAINER chase <adogthatcantalk@gmail.com>

###################
# install php 7.3
###################
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

####################
# install composer
####################
RUN apt-get install -y curl
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer
RUN curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig
# make sure we're installing what we think we're installing!
RUN php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot
RUN rm -f /tmp/composer-setup.*

####################
# install apache 2
####################
# this looks kinda stupid, but it works...will figure out anomolies later
RUN apt-get update
RUN apt-get install apache2 libapache2-mod-php7.3 -y
RUN apt-get update
# copy custom apache config file
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

################
# install mysql
################
# NOTHING! for multiple reasons ive decided it's more practical
# to have mysql run in it's own container, and i will link the repo
# once i have it working
# - merci beaucoup!

# dumbass terminal
ENV TERM dumb

################################
# install apache rewrite module
################################
RUN a2enmod rewrite

############################
# open default http port 80
############################
EXPOSE 80

############################
# container startup command
############################
CMD bash -c "apachectl -D FOREGROUND"
