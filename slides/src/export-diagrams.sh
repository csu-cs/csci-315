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

# B-Tree Style
bCode='
\usepackage{xparse}

\forestset{
  default preamble={%
    for tree={%
      draw, % show border
      edge={-stealth, shorten >=1pt, shorten <=-1pt}, % show arrow to child
      edge=very thick, % edge weight
      very thick, % node border
      fill=CSUcyan, % node fill
      text=black,% text color
      fit=tight,% options: tight|rectangle|band
      inner ysep=0,
      inner xsep=1pt,
      minimum height=1.75em,
    },%
  },%
  %
  invalid/.style={%
    {fill=red!25}%
  },
  visible on/.style={
  for tree={
    /tikz/visible on={#1},
    edge+={/tikz/visible on={#1}}}}
}

\tikzset{
  %
  % Used for beamer overlays
  invisible/.style={opacity=0,text opacity=0},
  visible on/.style={alt=#1{}{invisible}},
  alt/.code args={<#1>#2#3}{%
    \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}}
  },
}

\NewDocumentCommand{\BTreeSep}{}{%
  {\color{fg}\rule[-0.5em]{1.25pt}{1.75em}}%
}

\NewDocumentCommand{\BTreeVal}{ sD<>{CSUcyan}m }{%
  \begingroup
  \setlength{\fboxsep}{5.5pt}% make the spacing wider to cover the whole cell
  \colorbox{#2}{\hspace{-5.5pt}\makebox[1.75em][c]{\vspace{1.5em}#3\vspace{1.5em}}\hspace{-5.5pt}}%
  \IfBooleanTF #1%
    {}%
    {\BTreeSep}%
  \endgroup
}

\NewDocumentCommand{\BTreeNode}{ m }{%
	\begingroup
	\foreach\element [count=\i from 1] in {#1} {%
		\ifnum\i>1%After the first element
      \BTreeSep%
		\fi%
      \makebox[1.75em][c]{\vspace{1.5em}\element\vspace{1.5em}}%
	}%
	\endgroup%
}
'

graphCode='
\usepackage{tikz}
\usetikzlibrary{arrows,automata}

\tikzset{
  every state/.style={minimum size=12pt, inner sep=4pt, fill=CSUcyan, text=black, very thick},
  marked/.style={text=white, fill=CSUslate},
  visit/.style={text=black, fill=CSUgold},
  %-stealth,
  >=stealth'"'"',
  auto,
  node distance=1.5cm,
  font=\ttfamily,
  % main node/.style={circle,draw,font=\ttfamily\bfseries,minimum size=0pt, inner sep=2pt},
  every text node part/.style={align=center},
  %
  % Used for Beamer overlays
  invisible/.style={opacity=0,text opacity=0},
  visible on/.style={alt=#1{}{invisible}},
  alt/.code args={<#1>#2#3}{%
    \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}}
  },
}

% Used to stylize 0 in the adjacency matrix
\newcommand{\mFal}[1][0]{\texttt{\textcolor{CSUgold}{#1}}}
\newcommand{\mTru}[1][1]{\texttt{\textbf{#1}}}

\newcommand{\vertMark}[1][CSUgold]{full=#1}

\newcommand{\textInf}{$\infty$}

\newcommand{\arraySubscript}[1]{\texttt{\textcolor{white!75!CSUblue}{[}{#1}\textcolor{white!75!CSUblue}{]}}}

\long\def\invisible#1{\iffalse #1\fi} % No-op the contents of this command.
'


# bCode=$(printf '%s' "$bCode" | awk '{printf "%s\\n", $0}')
bCode=$(printf '%s' "$bCode" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/$/\\n/' | tr -d '\n')

graphCode=$(printf '%s' "$graphCode" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/$/\\n/' | tr -d '\n')

# Extract forest diagrams
awk '/\\begin{forest}/, /\\end{forest}/ {print}' "$TEX_FILE" | \
awk 'BEGIN{n=0} /\\begin{forest}/ {n++; fname=sprintf("'"$OUTDIR"'/forest-%02d.tex",n); print "\\documentclass[class=scrreprt,14pt]{standalone}\n\n\\usepackage{forest}\n\\usetikzlibrary{backgrounds}\n\n\\usepackage[english]{babel}\n\\usepackage[latin1]{inputenc}\n\\usepackage[default]{roboto} % Font family\n\\usepackage[varqu]{inconsolata} % for tt font\n\\usepackage[T1]{fontenc}\n\n\\usepackage{xcolor}\n\\definecolor{CSUblue}{HTML}{002855} % CSU Blue (primary)\n\\definecolor{CSUgold}{HTML}{A89968} % CSU Gold (primary)\n\\definecolor{CSUcyan}{HTML}{5eb6cd}\n\\definecolor{CSUslate}{HTML}{383838}\n\\definecolor{DarkGreen}{HTML}{25413a} % For contrast with gold.\n\\definecolor{MyPurple}{HTML}{995FA3} % Alternative color for highlight.\n\\definecolor{bg}{HTML}{000000}\n\\definecolor{fg}{HTML}{000000}\n\n\\usepackage{binary-trees}\n\n\n\\begin{document}">fname} {if(n>0) print >> fname} /\\end{forest}/ {print "\\end{document}" >> fname; close(fname)}'

# Extract tikz diagrams
awk '/\\begin{tikzpicture}/, /\\end{tikzpicture}/ {print}' "$TEX_FILE" | \
awk 'BEGIN{n=0} /\\begin{tikzpicture}/ {n++; fname=sprintf("'"$OUTDIR"'/tikz-%02d.tex",n); print "\\documentclass[class=scrreprt,14pt]{standalone}\n\\usepackage{tikz}\n\\usetikzlibrary{shapes,shapes.multipart,positioning,fit,backgrounds,calc}\n\n\\usepackage{listings}\n\\definecolor{codeKeyword}{HTML}{569CD6}\n\\definecolor{codeVariable}{HTML}{D7BA7D}\n\\definecolor{codeString}{HTML}{CE9178}\n\\definecolor{codeBackground}{HTML}{0a0c10}\n\\definecolor{codeComment}{HTML}{72ab58}\n\\lstset{\n  language=C++,\n  basicstyle=\\ttfamily\\color{white},\n  breaklines=true,\n  breakatwhitespace=true,\n  breakindent=3em,\n  tabsize=4,\n  showspaces=false,\n  showstringspaces=false,\n  commentstyle=\\color{codeComment}\\fontfamily{lmtt}\\itshape,\n  upquote=true,\n  literate={~}{{\\textasciitilde}}1,\n  keepspaces,\n  keywordstyle=\\color{codeKeyword}\\bfseries,\n  identifierstyle=\\color{codeVariable},\n  stringstyle=\\color{codeString},\n  morekeywords={nullptr},\n  backgroundcolor=\\color{codeBackground},\n  frame=single,\n  numbers=left,\n  numbersep=5pt,\n  numberstyle=\\tiny\\color{CSUcyan},\n  xleftmargin=10pt\n}\n\n% Custom background to lstinline\n\\usepackage{realboxes}\n\\usepackage{xpatch}\n\\makeatletter\n\\xpretocmd\\lstinline@{\\Colorbox{codeBackground}\\bgroup\\appto\\lst@DeInit{\\egroup}}{}{}\n\\xpretocmd\\lst@InlineG{\\Colorbox{codeBackground}\\bgroup\\appto\\lst@DeInit{\\egroup}}{}{}\n\\makeatother\n\n\n\\usepackage[english]{babel}\n\\usepackage[latin1]{inputenc}\n\\usepackage[default]{roboto} % Font family\n\\usepackage[varqu]{inconsolata} % for tt font\n\\usepackage[T1]{fontenc}\n\n\\usepackage{xcolor}\n\\definecolor{CSUblue}{HTML}{002855} % CSU Blue (primary)\n\\definecolor{CSUgold}{HTML}{A89968} % CSU Gold (primary)\n\\definecolor{CSUcyan}{HTML}{5eb6cd}\n\\definecolor{CSUslate}{HTML}{383838}\n\\definecolor{DarkGreen}{HTML}{25413a} % For contrast with gold.\n\\definecolor{MyPurple}{HTML}{995FA3} % Alternative color for highlight.\n\\definecolor{MyGreen}{HTML}{61ff7e}\n\n\\usepackage{ifthen}\n\\usepackage{xstring}\n\\usepackage{pgf-umlcd}\n\n\\usepackage{arrays}\n\\usepackage{linked-lists}\n\n\n\\tikzset{\n  point/.style={\n    circle,\n    fill=white,\n    draw=white,\n    very thick,\n    minimum size=8pt,\n    inner sep=0pt,\n  }\n}\n\n% For UML\n\\renewcommand{\\umlfillcolor}{CSUblue!80!black}\n\\renewcommand{\\umldrawcolor}{white}\n\\renewcommand{\\umltextcolor}{white}\n\n\n\n% Used for 3D Plot of Quadtree\n\\usepackage{pgfplots}\n\\pgfplotsset{compat=newest}\n\n\\tikzset{\n  stack/.style={%\n    rectangle split,\n    rectangle split parts=#1,\n    draw,\n    anchor=center,\n    minimum width=12mm,\n    minimum height=4mm,\n    font=\\tiny,\n    very thick,\n    line join=bevel,\n    fill=CSUcyan,\n    text=black,\n  },\n  stack top/.style={%\n    rectangle, draw, minimum size=12mm - 1pt,\n    yslant=0.5,xslant=-1, anchor=south west,\n    very thick,\n    xshift=-1pt,\n    yshift=-1pt,\n    line join=bevel,\n    fill=CSUcyan,\n    text=black,\n  },\n  stack instruction/.style={anchor=west, align=left, inner sep=0pt}\n}\n\\newcommand{\\Stack}[2][stack]{%\n  \\node[stack=#2, yslant=-0.5, anchor=south east, xshift=1pt] (A) {\n    #1\n  };\n\n  % Right of Stack\n  \\node[stack=#2, yslant=0.5, anchor=south west, xshift=-1pt] (B) {\n      #1\n  };\n\n  \n  % Top of Stack\n  \\node at (A.north east)  [anchor=west, shift={(-1pt, 0.7pt)}, stack top] (StackTop) {\n    \\rotatebox{-45}{#1}\n  };\n}\n\n'"$graphCode"'\n\n\n\\begin{document}">fname} {if(n>0) print >> fname} /\\end{tikzpicture}/ {print "\\end{document}" >> fname; close(fname)}'

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

  overlays=$(grep -oP '\\(only|onslide|alt|temporal)\s*<\K[0-9,\-]+' "$texfile" | tr ',' '\n' | \
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

        while (s{
            \\temporal\s*<([^>]+)>\s*
            (\{(?:[^{}]*+|\{(?:[^{}]*+|\{[^{}]*\})*\})*\})\s*
            (\{(?:[^{}]*+|\{(?:[^{}]*+|\{[^{}]*\})*\})*\})\s*
            (\{(?:[^{}]*+|\{(?:[^{}]*+|\{[^{}]*\})*\})*\})
        }{
            my ($spec, $braced1, $braced2, $braced3) = ($1, $2, $3, $4);
            my $c1 = substr($braced1, 1, -1);
            my $c2 = substr($braced2, 1, -1);
            my $c3 = substr($braced3, 1, -1);
            is_frame_in($spec, $f) ? $c2 : $c3;
        }gexs) {}

        # Replace all justText on=<> and visibile on=<>
        # Not quite correct, but good enough.
        while (s{
            \s*(justText|visible)\s+on\s*=\s*<([^>]+)>\s*
        }{
            my ($cmd, $spec) = ($1, $2);
            is_frame_in($spec, $f) ? $cmd : "";
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
