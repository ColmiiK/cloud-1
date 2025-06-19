#!/bin/sh

# Wait until WordPress is up and responding
until curl -s wordpress:80 >/dev/null; do
  echo "Waiting for WordPress to be up..."
  sleep 5
done

# Optional: create wp-config.php if not already there
if [ ! -f /var/www/html/wp-config.php ]; then
  wp config create \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="db" \
    --path=/var/www/html \
    --allow-root
fi

# Run the installation if WordPress isn't installed yet
if ! wp core is-installed --path=/var/www/html --allow-root; then
  wp core install \
    --url="$SITE_URL" \
    --title="$SITE_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --path=/var/www/html \
    --allow-root
else
  echo "WordPress already installed. Skipping installation."
fi
