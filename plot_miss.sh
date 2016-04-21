#!/usr/bin/gnuplot

set term png
set output "L1d.png"
set title "L1d cache miss rate"
set xlabel "dimension"
set ylabel "miss rate (%)"
set logscale x
set grid
plot 'data_normal.txt' u 1:4 w lp pt 5 title "raw",'data_trans.txt' u 1:4 w lp pt 7 title "col"

set output "L2d.png"
set title "L2d cache miss rate"
plot 'data_normal.txt' u 1:5 w lp pt 5 title "raw",'data_trans.txt' u 1:5 w lp pt 7 title "col"

set output "LLd.png"
set title "LLd cache miss rate"
plot 'data_normal.txt' u 1:6 w lp pt 5 title "raw",'data_trans.txt' u 1:6 w lp pt 7 title "col"

