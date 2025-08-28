set terminal pdf color size 5,3.5 background rgb "white"  # Output to PDF
set output "gnuplot-timings2.pdf"    # Name the output file

# # For SVG output
# set terminal svg size 500,300 standalone background rgb "white"
# set output "gnuplot-timings2.svg"

set datafile separator "," # CSV File
set datafile columnheaders   # tells gnuplot the first row has column names

set title "Algorithm Performance"
set ylabel "Time (in seconds)"
set xlabel "Data Size"
set grid # Show grid lines

plot [:180000][:] "gnuplot-timings2.csv" \
	using 1:2 with line lw 4 title "Algorithm 1",\
	"gnuplot-timings2.csv" \
	using 1:3 with line lw 4 title "Algorithm 2"
