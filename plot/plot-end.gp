set term png medium size 500,350
set output "end.png"

set ylabel "Latency (ms)"
set autoscale 
set yrange [0:800]
set ytics (0,200,400,600,800)

set xlabel "Concurrent Sysbench Threads"

set title "End-to-end Latency (Single thread)"
set nokey

set style fill solid
set boxwidth 0.5

plot 'data-end.csv' using 1:3:xtic(2) with boxes 
