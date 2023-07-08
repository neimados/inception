FROM debian:buster

COPY ./script/setup.sh /setup.sh

EXPOSE 9000

RUN apt-get update && apt-get -y upgrade && apt-get install -y php7.3-fpm php-mysql mariadb-client curl && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/html/wordpress /run/php && \
	chmod +x setup.sh && \
	usermod -G www-data -a www-data && chown -R www-data:www-data /var/www/

COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html/wordpress

ENTRYPOINT ["sh", "/setup.sh"]