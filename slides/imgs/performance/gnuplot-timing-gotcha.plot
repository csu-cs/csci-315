set terminal pdf color background rgb "white"  # Output to PDF
set output "gnuplot-timing-gotcha.pdf"    # Name the output file

# # For SVG output
# set terminal svg size 500,300 standalone background rgb "white"
# set output "gnuplot-timing-gotcha.svg"

set title "Algorithm Performance"
set ylabel "Time (in seconds)"
set xlabel "Data Size"
set grid # Show grid lines

plot [:10000][:] "sumOfOneTo.data" \
	using 1:2 with line lw 4 title "Linear Algorithm",\
	"intersectionCount.data" \
	using 1:2 with line lw 4 title "Quadratic Algorithm"

plot [:10000][:0.0001] "sumOfOneTo.data" \
	using 1:2 with line lw 4 title "Linear Algorithm",\
	"intersectionCount.data" \
	using 1:2 with line lw 4 title "Quadratic Algorithm"
