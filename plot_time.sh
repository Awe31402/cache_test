#!/usr/bin/gnuplot

set term png
set output "time.png"
set title "execution time"
set xlabel "dimension"
set ylabel "second(s)"
set logscale x
set grid
plot 'time_normal.txt' u 1:2 w lp pt 5 title "raw",'time_trans.txt' u 1:2 w lp pt 7 title "col"

