#!/bin/bash
set -eo pipefail

# verify env variables
if [ -z "$TEST_SYSTEM" -o -z "$MYSQL_HOST" -o -z "$MYSQL_USER" -o -z "$MYSQL_PASSWORD" ]; then
	echo >&2 'Backup information is not complete. You need to specify TEST_SYSTEM, MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD'
	exit 1
fi


#Test variables
export mysql_host="$MYSQL_HOST"
export mysql_user="$MYSQL_USER"
export mysql_password="$MYSQL_PASSWORD"

chmod a+x ./run.sh

./run.sh $mysql_host $mysql_user $mysql_password
