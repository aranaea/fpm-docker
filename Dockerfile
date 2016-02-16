FROM ubuntu:15.10

#init
RUN apt-get update

# PHP - TODO:  Add oll the modules that we have on prod
RUN apt-get install -y php5-fpm php5-mysql

# Configs
ADD config/www.conf /etc/php5/fpm/pool.d/
ADD config/php-fpm.conf /etc/php5/fpm/

VOLUME /etc/php5/fpm
VOLUME /var/www/php

expose 9000

CMD ["php5-fpm", "-O", "-F"]
