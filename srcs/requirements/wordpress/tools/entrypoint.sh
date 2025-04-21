#!/bin/bash

if [ ! -f "/usr/local/bin/wp" ]; then
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
fi

while [ ! -f "/wordpress/wp-config.php" ]; do
	if wp core download --path=/wordpress 2>/dev/null; then
		break
	fi
done

if [ ! -f "/wordpress/wp-config.php" ]; then
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_email=$WP_ADMIN_EMAIL
	wp user create $WP_USER $WP_EMAIL --role=administrator --user_pass=$WP_PASS

fi

exec php-fpm83 -F
