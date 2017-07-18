set term png medium size 700,500
set output "art.png"

set ylabel "Average Request Time (ms)"
set autoscale

set xlabel "Concurrent Sysbench Threads"
set xrange [1:256]
set logscale x 2 

set title "Average Request Execution Time by Concurrent Sysbench Threads"
set key Left reverse left top

set style data points

plot 'data-art.csv' using 1:2 with points pointtype 5 title "Google SQL MySQL 2nd Gen. + Failover Replica", \
     'data-art.csv' using 1:3 with points pointtype 5 title "Amazon RDS MySQL Multi-AZ", \
     'data-art.csv' using 1:4 with points pointtype 5 title "Custom MariaDB on GKE" 

