#!/bin/bash

folder='./data/'
filea='104.155.95.120'
fileb='benchmark.cpjghstwgewe.eu-west-1.rds.amazonaws.com'
filec='35.189.239.238'

tpsFile='data-tps.csv'
artFile='data-art.csv'
endFile='data-end.csv'

echo "Parsing data files - Threads per second"
echo -n "" > $tpsFile
for i in 1 2 4 8 16 32 64 128 256 512 
do
  first=$( cat ${folder}${filea}-${i}.txt | grep "transactions:" | awk '{print $3}' | tr -d '(')
  second=$( cat ${folder}${fileb}-${i}.txt | grep "transactions:" | awk '{print $3}' | tr -d '(')
  third=$( cat ${folder}${filec}-${i}.txt | grep "transactions:" | awk '{print $3}' | tr -d '(')
  echo "$i, $first, $second, $third" >>$tpsFile
done

echo "Parsing data files - Average Request Time"
echo -n "" >$artFile
for i in 1 2 4 8 16 32 64 128 256 512
do
  first=$( cat ${folder}${filea}-${i}.txt | grep "avg:" | awk '{print $2}' | tr -d '(' | sed 's/ms//')
  second=$( cat ${folder}${fileb}-${i}.txt | grep "avg:" | awk '{print $2}' | tr -d '(' | sed 's/ms//')
  third=$( cat ${folder}${filec}-${i}.txt | grep "avg:" | awk '{print $2}' | tr -d '(' | sed 's/ms//')
  echo "$i, $first, $second, $third" >>$artFile
done

echo "Parsing data files - End-to-end latency"
echo -n "" >$endFile
i=1 # 1 thread
first=$( cat ${folder}${filea}-${i}.txt | grep "avg:" | awk '{print $2}' | tr -d '(' | sed 's/ms//')
second=$( cat ${folder}${fileb}-${i}.txt | grep "avg:" | awk '{print $2}' | tr -d '(' | sed 's/ms//')
third=$( cat ${folder}${filec}-${i}.txt | grep "avg:" | awk '{print $2}' | tr -d '(' | sed 's/ms//')
echo "0 \"Google SQL\" $first" >>$endFile
echo "1 \"Amazon RDS\" $second" >>$endFile
echo "2 \"Custom MariaDB\" $third" >>$endFile


