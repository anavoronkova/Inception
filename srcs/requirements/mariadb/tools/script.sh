#!/bin/bash

echo "Starting MariaDB"
service mariadb start
sleep 2
# Create db
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

echo "Creating user"
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "CREATE USER IF NOT EXISTS \`$(<"/run/secrets/mariadb_user")\`@'localhost' IDENTIFIED BY '$(<"/run/secrets/mariadb_pass")';"

# Grant root privileges
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`$(<"/run/secrets/mariadb_user")\`@'%' IDENTIFIED BY '$(<"/run/secrets/mariadb_pass")';"

# Set root pass
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(<"/run/secrets/mariadb_root_pass")';"
sleep 1

# Flush privileges
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "FLUSH PRIVILEGES;"
sleep 1

#  Stop MariaDB to restart in safe mode with new user
mysqladmin -u root -p$(<"/run/secrets/mariadb_root_pass") shutdown
sleep 2

exec mariadbd-safe
