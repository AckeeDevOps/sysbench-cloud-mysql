#!/bin/bash
set -eo pipefail

# verify env variables
if [ -z "$TEST_SYSTEM" -o -z "$MYSQL_HOST" -o -z "$MYSQL_USER" -o -z "$MYSQL_PASSWORD" ]; then
	echo >&2 'Backup information is not complete. You need to specify TEST_SYSTEM, MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD'
	exit 1
fi


#Test variables
export test_system="$TEST_SYSTEM" 
export mysql_host="$MYSQL_HOST"
export mysql_user="$MYSQL_USER"
export mysql_password="$MYSQL_PASSWORD"
export test_path=~/oltp_${test_system}_1
export test_name=01_baseline

cd /sysbench
#chmod a+x ./sysbench

#Prepare test data
sysbench \
  --mysql-host=${mysql_host} \
  --mysql-user=${mysql_user} \
  --mysql-password=${mysql_password} \
  --mysql-db="sbtest" \
  --test=sysbench/tests/db/parallel_prepare.lua \
  --oltp_tables_count=100 \
  --oltp-table-size=20000000 \
  --rand-init=on \
  --num-threads=16 \
  run
