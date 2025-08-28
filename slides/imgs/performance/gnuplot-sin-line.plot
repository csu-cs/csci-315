set terminal pdf color size 3.75,2.25 background rgb "white"
set output "gnuplot-sin-line.pdf"

# # For SVG output
# set terminal svg size 375,225 standalone background rgb "white"
# set output "gnuplot-sin-line.svg"

plot sin(x) with line
