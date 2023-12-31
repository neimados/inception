wp core download --allow-root

until mysqladmin -h $MYSQL_HOST -u $MYSQL_USER --password=$MYSQL_PASSWORD ping 2> /dev/null ; do
	echo "Waiting for MARIADB"
	sleep 1
done

wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --allow-root

wp core install --url=localhost/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

echo "WP OK"

exec /usr/sbin/php-fpm7.3 -F