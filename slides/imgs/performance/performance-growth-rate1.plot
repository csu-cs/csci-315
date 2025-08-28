set terminal pdf color size 5,3 #background rgb "black"  # Output to PDF
set output "performance-growth-rate1.pdf"    # Name the output file

# # For SVG output
# set terminal svg size 500,300 standalone #background rgb "white"
# set output "performance-growth-rate1-dark.svg"

# Colors for a Dark Theme.
set border lc rgb "#FFFFFF"
set tics textcolor rgb "#FFFFFF"
set xlabel "X" tc rgb "#FFFFFF"
set ylabel "Y" tc rgb "#FFFFFF"
set zlabel "Z" tc rgb "#FFFFFF"
set key textcolor rgb "white"

set xlabel "Size (n)" offset 0,0.9 font ",16"
set ylabel "Time" offset 0.9,0 font ",16"
set lmargin at screen 0.1
set key font ",16"
set grid lc rgb "#FFFFFF" # Show grid lines

f1(n) = 5*n**2
f2(n) = 7*n + 100

plot [n=0:10] f1(n) with lines lw 4 lc "#995FA3" title "5n^2", \
              f2(n) with lines lw 4 lc "#5eb6cd" title "7n + 100"