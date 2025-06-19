#!/bin/bash
set -e

# Wait for MySQL to be ready
echo "Waiting for MySQL..."
until nc -z "$WORDPRESS_DB_HOST" 3306; do
  sleep 2
done
echo "MySQL is up."

# Check if WordPress is installed
if ! wp core is-installed --allow-root; then
  echo "WordPress not installed. Installing..."
  wp core install \
    --url="$WORDPRESS_URL" \
    --title="$WORDPRESS_TITLE" \
    --admin_user="$WORDPRESS_ADMIN" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --skip-email \
    --allow-root
  echo "WordPress installed."
else
  echo "WordPress already installed."
fi

# Execute default entrypoint or other commands if needed
exec "$@"
