# set terminal pdf color size 3.75,2.25 background rgb "white"
# set output "gnuplot-sin-line-labeled.pdf"

# For SVG output
set terminal svg size 375,225 standalone background rgb "white"
set output "gnuplot-sin-line-labeled.svg"

set title "Sine Wave"          # Add a title to the top.
set ylabel "Amplitude"         # Label the y axis.
set xlabel "Time (in Seconds)" # Label the x axis.

plot sin(x) with line
