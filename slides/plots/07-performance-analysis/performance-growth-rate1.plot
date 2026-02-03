set terminal tikz latex fontscale 1 butt charsize 8pt,10pt size 12,7.5 #createstyle # background rgb "black"
set output "plots/07-performance-analysis/performance-growth-rate1.tex"    # Name the output file
# set terminal pdfcairo enhanced color size 5.6,3.5 font "Arial,20" #background rgb "black"
# set output "performance-growth-rate1.pdf"    # Name the output file

# # For SVG output
# set terminal svg size 500,300 standalone #background rgb "white"
# set output "performance-growth-rate1-dark.svg"

set xtics font ",12"
set ytics font ",12"

# For a Dark Theme.
set border lc rgb "#A89968"
set tics textcolor rgb "#FFFFFF"
set xlabel tc rgb "#FFFFFF"
set ylabel tc rgb "#FFFFFF"
set key textcolor rgb "#FFFFFF"
set key spacing 1.5
set border lw 2

set xlabel "Data Size~~$n$" #font ",20"
set ylabel "Operations / Time~~$f(n)$" #offset 0.9,0 #font ",20"
set lmargin 6.5   # wider left margin
set rmargin 1   # narrower right margin
set tmargin 0.5   # narrower top margin
#set key font ",20"
# set grid lc rgb "#FFFFFF" # Show grid lines

f1(n) = 5*n**2
f2(n) = 7*n + 100

plot [n=0:10] f1(n) with lines lw 6 lc rgb "#de425b" title "$5n^2$", \
              f2(n) with lines lw 6 lc "#488f31" title "$7n + 100$"