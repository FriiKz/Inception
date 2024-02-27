#!/bin/sh

rm -rf /var/www/html/wordpress/wp-config.php

wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost="mariadb" --path="/var/www/html/wordpress/" --allow-root --skip-check
wp config set WP_CACHE true --raw --allow-root;
wp config set WP_CACHE_KEY_SALT lbusi.42.fr --allow-root;

if ! wp core is-installed --allow-root; then
    wp core install --url="lbusi.42.fr" --title="lbusi's wordpress site" --admin_user="lbusi" --admin_password="sucalodo" --admin_email="youremail@gmail.com" --path="/var/www/html/wordpress/" --allow-root
fi

if ! wp user get Estriper --allow-root; then
	wp user create Estriper Estriper@cago.fr --role=author --user_pass="123" --allow-root
fi

chown -R www-data:www-data /var/www/html/wordpress

exec php-fpm7.3 --nodaemonize