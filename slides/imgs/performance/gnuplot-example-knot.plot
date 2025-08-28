set terminal pdf color size 4.5,3
set output "gnuplot-example-knot.pdf"

# # For SVG output
# set terminal svg size 550,350 standalone
# set output "gnuplot-example-knot-dark.svg"

set nokey

# Colors for a Dark Theme.
set border lc rgb "#A89968"
set tics textcolor rgb "#A89968"
set xlabel "X" tc rgb "#A89968"
set ylabel "Y" tc rgb "#A89968"
set zlabel "Z" tc rgb "#A89968"

# # Colors for a Light Theme.
# set border lc rgb "#A89968"
# set tics textcolor rgb "#A89968"
# set xlabel "X" tc rgb "#A89968"
# set ylabel "Y" tc rgb "#A89968"
# set zlabel "Z" tc rgb "#A89968"

set tmargin at screen 0.97
set bmargin at screen 0.29
set lmargin at screen 0.19
set rmargin at screen 0.86

set parametric
set hidden3d
set view 30,40
set isosamples 200,15


splot [-3*pi:3*pi][-pi:pi] cos(u)*cos(v)+3*cos(u)*(1.5+sin(u*5/3)/2),\
	sin(u)*cos(v)+3*sin(u)*(1.5+sin(u*5/3)/2), sin(v)+2*cos(u*5/3) \
	lc rgb "white" lw 2 # white line for dark background