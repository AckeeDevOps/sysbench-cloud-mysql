#!/bin/bash

host=$1
user=$2
pw=$3

#prepare
sysbench --test=oltp --oltp-table-size=10000000 --mysql-host=$host --mysql-user=$user --mysql-password=$pw --db-driver=mysql prepare

#run oltp for different number of threads
for i in 1 2 4 8 16 32 64 128 256 512 1024 2048 4096;
do
  echo running test for $i threads
  sysbench --test=oltp  --max-requests=0 --num-threads=$i --max-time=600 --mysql-host=$host --mysql-password=$pw --mysql-user=$user --db-driver=mysql --oltp-test-mode=complex run >${host}-${i}.txt
done 
