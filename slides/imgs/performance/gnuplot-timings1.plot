set terminal pdf color background rgb "white"
set output "gnuplot-timings1.pdf"    # Name the output file

# # For SVG output
# set terminal svg size 500,300 standalone background rgb "white"
# set output "gnuplot-timings1.svg"

set title "Algorithm Performance"
set ylabel "Time (in seconds)"
set xlabel "Data Size"
set grid # Show grid lines

# Make line thicker with lw 3
# Change the line's title with title "Runtime"
plot "gnuplot-timings1.data" \
	using 1:2 with line lw 3 title "Runtime"
