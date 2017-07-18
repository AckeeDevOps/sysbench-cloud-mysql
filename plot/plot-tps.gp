set term png medium size 1024,768
set output "output.png"

set ylabel "Transaction Rate (tps)"

set autoscale

set xlabel "Concurrent Sysbench Threads"
set xrange [1:512]
set logscale x 2 

set title "Transaction Rate by Concurrent Sysbench Threads"
set key Left reverse left top
#set grid

set style data points

plot 'data-tps.csv' using 1:2 with points pointtype 5 title "Google SQL MySQL 2nd Gen. + Failover Replica", \
     'data-tps.csv' using 1:3 with points pointtype 5 title "Amazon RDS MySQL Multi-AZ", \
     'data-tps.csv' using 1:4 with points pointtype 5 title "Custom MariaDB on GKE" 
