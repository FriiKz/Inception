FROM debian:buster

RUN apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq php7.3 php7.3-fpm php7.3-mysql curl

WORKDIR /tmp/wordpress/

COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/config.sh /tmp/wordpress/

RUN mkdir -p /run/php ;\
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;\
chmod +x wp-cli.phar ;\
mv wp-cli.phar /usr/local/bin/wp



WORKDIR /var/www/html/wordpress

RUN wp core download --allow-root ;\
chown -R www-data:www-data /var/www/html

CMD ["sh", "/tmp/wordpress/config.sh"]


# FROM debian:buster

# RUN apt-get update && \
# 	apt-get upgrade && \
# 	apt-get -y install wget

# RUN apt-get install -y php7.3 && \
# 	apt-get install -y php-fpm && \
# 	apt-get install -y php-mysql && \
# 	apt-get install -y mariadb-client

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
# 	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
# 	chown -R root:root /var/www/wordpress

# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# 	#  ./conf/wp-config.php /var/www/wordpress/wp-sonfig-sample.php

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
# 	chmod +x wp-cli.phar && \
# 	mv wp-cli.phar /usr/local/bin/wp

# COPY ./conf/auto_config.sh .

# WORKDIR /var/www/html/wordpress

# RUN wp core download --allow-root ;\
# chown -R www-data:www-data /var/www/html

# ENTRYPOINT ["sh", "/auto_config.sh"]