#!/bin/sh

set -e

DATADIR="/var/lib/mysql"

if [ ! -d "$DATADIR/$MYSQL_DATABASE" ]; then
	echo "Inicializando base de datos..."
	mysql_install_db --user=mysql --basedir=/usr --datadir=$DATADIR
	mysqld --user=mysql --bootstrap <<-EOSQL
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
	CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
	FLUSH PRIVILEGES;
EOSQL

  echo "Base de datos inicializada."
else
	  echo "Base de datos ya inicializada, omitiendo setup."
fi

exec mysqld --user=mysql
