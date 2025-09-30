#!/bin/bash

# Usage: ./export-diagrams.sh 01-introduction.tex

TEX_FILE="$1"
OUTDIR="diagrams"
mkdir -p "$OUTDIR"

# Verify that input argument is provided and the file exists
if [ -z "$TEX_FILE" ] || [ ! -f "$TEX_FILE" ]; then
    echo "Usage: $0 <path-to-tex-file>"
    exit 1
fi

echo "Extracting diagrams from ${TEX_FILE} to ${OUTDIR}."

# Extract forest diagrams
awk '/\\begin{forest}/, /\\end{forest}/ {print}' "$TEX_FILE" | \
awk 'BEGIN{n=0} /\\begin{forest}/ {n++; fname=sprintf("'"$OUTDIR"'/forest-%02d.tex",n); print "\\documentclass[class=scrreprt,14pt]{standalone}\n\\usepackage{forest}\n\n\\usepackage[english]{babel}\n\\usepackage[latin1]{inputenc}\n\\usepackage[default]{roboto} % Font family\n\\usepackage[varqu]{inconsolata} % for tt font\n\\usepackage[T1]{fontenc}\n\n\\usepackage{xcolor}\n\\definecolor{CSUblue}{HTML}{002855} % CSU Blue (primary)\n\\definecolor{CSUgold}{HTML}{A89968} % CSU Gold (primary)\n\\definecolor{CSUcyan}{HTML}{5eb6cd}\n\\definecolor{CSUslate}{HTML}{383838}\n\\definecolor{DarkGreen}{HTML}{25413a} % For contrast with gold.\n\\definecolor{MyPurple}{HTML}{995FA3} % Alternative color for highlight.\n\n\\forestset{\n  treeNode/.style={%\n    circle, % node shape\n    draw=black, %line and border color\n    edge=->, % show arrow to child\n    edge=very thick, %edge weight\n    very thick, % node boarder\n    fill=CSUcyan, % node fill\n    text=black,% text color\n    %fit=rectangle, % the resulting tree will usually be wide\n    fit=band,%\n    %inner sep=0.3em,\n    l sep=0em,% distnace between levels\n  },\n  default preamble={%\n    for tree={%\n      treeNode%\n    },%\n  },%\n  %\n  headPtr/.style={\n    anchor=north,l sep=0.5em,%\n    ellipse,draw=none, inner sep=0, fill=none, text=white\n  },\n  %\n  % Used for beamer overlays\n  visible on/.style={\n    for tree={\n      /tikz/visible on={#1},\n      edge+={/tikz/visible on={#1}}}},\n  %\n  % Hide just the node, not its children (and the edges connecting it)\n  node visible on/.style={\n      /tikz/visible on={#1},\n      edge+={/tikz/visible on={#1}},\n      for children={edge+={/tikz/visible on={#1}}}%\n  },%\n  %\n  edge highlight on/.style={\n    edge+={/tikz/highlight on={#1}}\n  }\n}\n\\begin{document}">fname} {if(n>0) print >> fname} /\\end{forest}/ {print "\\end{document}" >> fname; close(fname)}'

# Extract tikz diagrams
awk '/\\begin{tikzpicture}/, /\\end{tikzpicture}/ {print}' "$TEX_FILE" | \
awk 'BEGIN{n=0} /\\begin{tikzpicture}/ {n++; fname=sprintf("'"$OUTDIR"'/tikz-%02d.tex",n); print "\\documentclass[class=scrreprt,14pt]{standalone}\n\\usepackage{tikz}\n\\usetikzlibrary{shapes,positioning,fit,backgrounds,calc}\n\n\\usepackage{listings}\n\\definecolor{codeKeyword}{HTML}{569CD6}\n\\definecolor{codeVariable}{HTML}{D7BA7D}\n\\definecolor{codeString}{HTML}{CE9178}\n\\definecolor{codeBackground}{HTML}{0a0c10}\n\\definecolor{codeComment}{HTML}{72ab58}\n\\lstset{\n  language=C++,\n  basicstyle=\\ttfamily\\color{white},\n  breaklines=true,\n  breakatwhitespace=true,\n  breakindent=3em,\n  tabsize=4,\n  showspaces=false,\n  showstringspaces=false,\n  commentstyle=\\color{codeComment}\\fontfamily{lmtt}\\itshape,\n  upquote=true,\n  literate={~}{{\\textasciitilde}}1,\n  keepspaces,\n  keywordstyle=\\color{codeKeyword}\\bfseries,\n  identifierstyle=\\color{codeVariable},\n  stringstyle=\\color{codeString},\n  morekeywords={nullptr},\n  backgroundcolor=\\color{codeBackground},\n  frame=single,\n  numbers=left,\n  numbersep=5pt,\n  numberstyle=\\tiny\\color{CSUcyan},\n  xleftmargin=10pt\n}\n\n% Custom background to lstinline\n\\usepackage{realboxes}\n\\usepackage{xpatch}\n\\makeatletter\n\\xpretocmd\\lstinline@{\\Colorbox{codeBackground}\\bgroup\\appto\\lst@DeInit{\\egroup}}{}{}\n\\xpretocmd\\lst@InlineG{\\Colorbox{codeBackground}\\bgroup\\appto\\lst@DeInit{\\egroup}}{}{}\n\\makeatother\n\n\n\\usepackage[english]{babel}\n\\usepackage[latin1]{inputenc}\n\\usepackage[default]{roboto} % Font family\n\\usepackage[varqu]{inconsolata} % for tt font\n\\usepackage[T1]{fontenc}\n\n\\usepackage{xcolor}\n\\definecolor{CSUblue}{HTML}{002855} % CSU Blue (primary)\n\\definecolor{CSUgold}{HTML}{A89968} % CSU Gold (primary)\n\\definecolor{CSUcyan}{HTML}{5eb6cd}\n\\definecolor{CSUslate}{HTML}{383838}\n\\definecolor{DarkGreen}{HTML}{25413a} % For contrast with gold.\n\\definecolor{MyPurple}{HTML}{995FA3} % Alternative color for highlight.\n\\definecolor{MyGreen}{HTML}{61ff7e}\n\n\\usepackage{ifthen}\n\\usepackage{arrays}\n\\usepackage{linked-lists}\n\n\n\\tikzset{\n  point/.style={\n    circle,\n    fill=white,\n    draw=white,\n    very thick,\n    minimum size=8pt,\n    inner sep=0pt,\n  }\n}\n\n% Used for 3D Plot of Quadtree\n\\usepackage{pgfplots}\n\\pgfplotsset{compat=newest}\n\n\n\\begin{document}">fname} {if(n>0) print >> fname} /\\end{tikzpicture}/ {print "\\end{document}" >> fname; close(fname)}'

# # Compile and convert each diagram
# for f in "$OUTDIR"/*.tex; do
#     pdflatex.exe -output-directory "$OUTDIR" "$f"
#     PDF="${f%.tex}.pdf"
#     SVG="${f%.tex}.svg"
#     if [ -f "$PDF" ]; then
#         pdf2svg "$PDF" "$SVG"
#         echo "Exported $SVG"

#         # Clean up auxiliary and log files
#         rm -f "${f%.tex}.aux" "${f%.tex}.log"

#         # Clean up extra Beamer files if present
#         rm -f "${f%.tex}.aux" "${f%.tex}.snm" "${f%.tex}.nav" "${f%.tex}.out" "${f%.tex}.toc"
#     fi
# done

# Compile and convert each diagram. If there are Beamer overlays, try to split them out.
for texfile in "${OUTDIR}"/*.tex; do
  base=$(basename "$texfile" .tex)

  overlays=$(grep -oP '\\(only|onslide|alt)\s*<\K[0-9,\-]+' "$texfile" | tr ',' '\n' | \
    perl -ne '
      while (/(\d+)(?:-(\d+))?/g) {
        if (defined $2) {
          print "$_\n" for $1..$2;
        } else {
          print "$1\n";
        }
      }' | sort -nu)

  if [[ -z "$overlays" ]]; then
    # No overlays: compile as-is
    echo "Compiling: $texfile"
    pdflatex.exe -output-directory="${OUTDIR}" -interaction=nonstopmode "$texfile"
    [[ -f "${OUTDIR}/${base}.pdf" ]] && pdf2svg "${OUTDIR}/${base}.pdf" "${OUTDIR}/${base}.svg"
    [[ -f "${OUTDIR}/${base}.svg" ]] && rm -f "${OUTDIR}/${base}.log" "${OUTDIR}/${base}.aux"
  else
    echo "Overlays detected in $base: generating cumulative frames"

    maxframe=$(echo "$overlays" | tail -n 1)

    for ((frame=1; frame<=maxframe; frame++)); do
      echo "


→ Frame $frame"
      outname="${base}-frame${frame}"
      newfile="$OUTDIR/${outname}.tex"

      # Expand overlays for current frame
      F=$frame perl -0777 -pe '
        use strict;
        use warnings;

        my $f = $ENV{F};

        # Replace all \only, \onslide, \alt recursively
        while (s{
            \\(only|onslide)\s*<([^>]+)>\s*
            (\{(?:[^{}]*+|\{(?:[^{}]*+|\{[^{}]*\})*\})*\})
        }{
            my ($cmd, $spec, $braced) = ($1, $2, $3);
            my $content = substr($braced, 1, -1);  # remove outer {}
            is_frame_in($spec, $f) ? $content : "";
        }gexs) {}

        while (s{
            \\alt\s*<([^>]+)>\s*
            (\{(?:[^{}]*+|\{(?:[^{}]*+|\{[^{}]*\})*\})*\})\s*
            (\{(?:[^{}]*+|\{(?:[^{}]*+|\{[^{}]*\})*\})*\})
        }{
            my ($spec, $braced1, $braced2) = ($1, $2, $3);
            my $c1 = substr($braced1, 1, -1);
            my $c2 = substr($braced2, 1, -1);
            is_frame_in($spec, $f) ? $c1 : $c2;
        }gexs) {}

        sub is_frame_in {
            my ($spec, $frame) = @_;
            foreach my $part (split /,/, $spec) {
            if ($part =~ /^(\d+)-(\d+)$/) {
                return 1 if $frame >= $1 && $frame <= $2;
            } elsif ($part =~ /^(\d+)-$/) {
                return 1 if $frame >= $1;
            } elsif ($part =~ /^-(\d+)$/) {
                return 1 if $frame <= $1;
            } elsif ($part =~ /^\d+$/) {
                return 1 if $frame == $part;
            } else {
                warn "\n\n\n\n\n\n\n\nUnmatched overlay spec part: '$part' (frame=$frame)\n\n\n";
            }
            }
            return 0;
        }
      ' "$texfile" > "$newfile"


      pdflatex.exe -output-directory="${OUTDIR}" -interaction=nonstopmode "$newfile"

      if [ -f "${OUTDIR}/${outname}.pdf" ]; then
        pdf2svg "${OUTDIR}/${outname}.pdf" "$OUTDIR/${outname}.svg"
        rm -f "${OUTDIR}/${outname}.aux"
        # rm -f "$newfile" "${OUTDIR}/${outname}.log" "${OUTDIR}/${outname}.aux"
      fi

    #   # Delete tex file if the svg was successfully created
    #   [[ -f "$OUTDIR/${outname}.svg" ]] && rm -f "$newfile"
    done

    # # Remove original texfile after successful frame generation
    # if [ -f "${OUTDIR}/${base}-frame${maxframe}.svg" ]; then
    #     rm -f "$texfile"
    # fi
  fi
done

# Change the height and width of all SVGs to be 125% of their original size using sed.
for svg in "$OUTDIR"/*.svg; do
  if [ -f "$svg" ]; then
    # Extract current width and height (assumes px units or no units)
    width=$(sed -n 's/.*<svg[^>]*width="\([0-9.]*\)[^"]*".*/\1/p' "$svg" | head -n1)
    height=$(sed -n 's/.*<svg[^>]*height="\([0-9.]*\)[^"]*".*/\1/p' "$svg" | head -n1)
    # Only proceed if both width and height are found and are numbers
    if [[ $width =~ ^[0-9.]+$ && $height =~ ^[0-9.]+$ ]]; then
      new_width=$(awk "BEGIN {printf \"%.3f\", $width * 1.25}")
      new_height=$(awk "BEGIN {printf \"%.3f\", $height * 1.25}")
      # Replace width and height in the SVG file
      sed -i "0,/\(<svg[^>]*width=\"\)[0-9.]\+\([^\"]*\"\)/s//\1${new_width}\2/" "$svg"
      sed -i "0,/\(<svg[^>]*height=\"\)[0-9.]\+\([^\"]*\"\)/s//\1${new_height}\2/" "$svg"
      echo "Resized $svg"
    else
      echo "Could not extract width/height for $svg"
    fi
  fi
done

# Clean up generated PDFs
# rm -f $OUTDIR/*.pdf
