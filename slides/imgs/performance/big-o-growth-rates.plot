set terminal pdfcairo enhanced color size 7,3.5 font "Arial,20" #background rgb "black"
set output "big-o-growth-rates.pdf"


# # For SVG output
# set terminal svg size 700,350 standalone
# set output "big-o-growth-rates-dark.svg"

# # For standalone LaTeX output
# set terminal cairolatex pdf color size 7in,3.5in #standalone
# set output 'big-o-growth-rates.tex'

# Define max x and y for polygon points
xmax = 25
ymax = 400

#set title "Growth Rates of Common Big O Functions"
set xlabel "Data Size  {/:Italic n}" font ",20"
set ylabel "Operations / Time  {/:Italic f} ({/:Italic n})" font ",20"
set xrange [0:xmax]
set yrange [0:ymax]
set grid
# set object 1 rectangle from graph 0,0 to graph 1,1 fillcolor rgb "white" behind
# set tmargin 3   # wider top margin
set rmargin 9   # wider right margin
set xtics font ",16"
set ytics font ",16"

# For a Dark Theme.
set border lc rgb "#A89968"
set tics textcolor rgb "#FFFFFF"
set xlabel tc rgb "#FFFFFF"
set ylabel tc rgb "#FFFFFF"

# #===== Background Polygons =======
# #====== Top Polygon ======
# # Calculate y at xmax on the line y=16x
# yline_at_xmax = 7 * xmax

# # Clip y at ymax if needed
# yclip = (yline_at_xmax > ymax) ? ymax : yline_at_xmax

# # Create the polygon (clockwise)
# set object 1 polygon \
#     from 0,0 to xmax,yclip to xmax,ymax to 0,ymax \
#     fillcolor rgb "#de425b" fillstyle solid

# #====== Middle 1 Polygon ======
# # Compute and clip y-values for lower and upper lines at xmax
# y_lower = 2 * xmax
# y_upper = 7 * xmax
# y_lower_clip = (y_lower > ymax) ? ymax : y_lower
# y_upper_clip = (y_upper > ymax) ? ymax : y_upper

# # Polygon filling between f(n)=3n and f(n)=7n
# set object 2 polygon from \
#     0,0 to xmax,y_lower_clip to xmax,y_upper_clip to 0,0 fillcolor rgb "#f9a160" fillstyle solid

# #====== Middle 2 Polygon ======
# # Compute and clip y-values for lower and upper lines at xmax
# y_lower = 0.5 * xmax
# y_upper = 2 * xmax
# y_lower_clip = (y_lower > ymax) ? ymax : y_lower
# y_upper_clip = (y_upper > ymax) ? ymax : y_upper

# # Polygon filling between f(n)=3n and f(n)=7n
# set object 3 polygon from \
#     0,0 to xmax,y_lower_clip to xmax,y_upper_clip to 0,0 fillcolor rgb "#a6a73e" fillstyle solid

# #====== Bottom Polygon ======
# # Compute and clip y-values for lower and upper lines at xmax
# y_lower = 0 * xmax
# y_upper = 0.5 * xmax
# y_lower_clip = (y_lower > ymax) ? ymax : y_lower
# y_upper_clip = (y_upper > ymax) ? ymax : y_upper

# # Polygon filling between f(n)=3n and f(n)=7n
# set object 4 polygon from \
#     0,0 to xmax,y_lower_clip to xmax,y_upper_clip to 0,0 fillcolor rgb "#488f31" fillstyle solid


# safe log2 (avoid log(0) issues)
log2(x) = (x<=0) ? 0 : log(x)/log(2.0)

# raw functions (use gamma for factorial so non-integer n works)
f_log(n)   = log2(n)
f_n(n)     = n
f_nlogn(n) = n*log2(n)
f_n2(n)    = n**2
f_n3(n)    = n**3
f_2n(n)    = 2**n
f_fact(n)  = gamma(n+1)    # gamma(n+1) = n!

# --- manual label positions for ymax = 20 ---
# (these n values were computed so f(n) ≈ 20)
nx_log   = xmax      # log2(n)=30 => n huge, put at right edge
nx_n     = xmax      # n=30 is outside x-range, place at right edge
nx_nlogn = xmax     # n log₂ n = 400 => n ≈ 66.1429
nx_n2    = sqrt(ymax)
nx_n3    = cbrt(ymax)
nx_2n    = log2(ymax)
nx_fact  = 5.68193    # approx where n! ≈ 400

# Place labels (color matched to curves)
set label "log₂ {/:Italic n}"               at nx_log,   f_log(nx_log)    left offset 0.5,0 tc rgb "#488f31" font ",20"
set label "{/:Italic n}"                    at nx_n,     f_n(nx_n)        left offset 0.5,0 tc rgb "#88a037" font ",20"
set label "{/:Italic n} log₂ {/:Italic n}"  at nx_nlogn, f_nlogn(nx_nlogn) left offset 0.5,0 tc rgb "#c0af4a" font ",20"
set label "{/:Italic n}²"        at nx_n2,    f_n2(nx_n2)      center offset 0.5,0.5 tc rgb "#f4bd6a" font ",20"
set label "{/:Italic n}³"        at nx_n3,    f_n3(nx_n3)      center offset 0,0.5 tc rgb "#ef9556" font ",20"
set label "2{/:Italic ⁿ}"        at nx_2n,    f_2n(nx_2n)      center offset 0,0.5 tc rgb "#e56b4e" font ",20"
set label "{/:Italic n}!"        at nx_fact,  ymax  center offset 0,0.5 tc rgb "#de425b" font ",20"

# # Special handling for 2^n — move label further away with arrow
# set label "2{/:Italic ⁿ}" at nx_2n,422 center tc rgb "#e56b4e"
# set arrow from nx_2n,420.5 to nx_2n,400+0.25 lw 2 lc rgb "#e56b4e"

# Plot raw curves (no scaling)
plot f_log(x)   with lines lw 4 lc rgb "#488f31" notitle, \
     f_n(x)     with lines lw 4 lc rgb "#89a036" notitle, \
     f_nlogn(x) with lines lw 4 lc rgb "#c1ae4a" notitle, \
     f_n2(x)    with lines lw 4 lc rgb "#f5bc6b" notitle, \
     f_n3(x)    with lines lw 4 lc rgb "#f39659" notitle, \
     f_2n(x)    with lines lw 4 lc rgb "#ec6e55" notitle, \
     f_fact(x)  with lines lw 4 lc rgb "#de425b" notitle

unset output
