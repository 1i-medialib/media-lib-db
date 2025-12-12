#!/bin/bash

set -e
set -u

function create_user_and_database() {
	local database=$1
	echo "  Creating user and database '$database'"
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	    CREATE DATABASE ${database};
        CREATE USER ${database}_app WITH ENCRYPTED PASSWORD 'apppass';
	    GRANT ALL PRIVILEGES ON DATABASE ${database} TO ${database}_app;
        \connect $database postgres;
	    GRANT ALL ON SCHEMA PUBLIC To ${database}_app;
	    GRANT ALL PRIVILEGES ON DATABASE ${database} TO ${database}_app;
	    GRANT ALL ON SCHEMA PUBLIC To lidarr_user;
EOSQL
}

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE admin_user PASSWORD 'admin' INHERIT LOGIN;
    CREATE USER lidarr_user WITH ENCRYPTED PASSWORD 'lidarr';
EOSQL

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
	echo "Multiple database creation requested: $POSTGRES_MULTIPLE_DATABASES"
	for db in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' '); do
		create_user_and_database $db
	done
	echo "Multiple databases created"
fi

echo "Granting lidarr_user privileges"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    GRANT ALL PRIVILEGES ON DATABASE lidarr_main TO lidarr_user;
    GRANT ALL PRIVILEGES ON DATABASE lidarr_log TO lidarr_user;
EOSQL
