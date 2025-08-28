#!/bin/bash

# Usage: ./latex-for-conversion.sh input.tex
# Produces: input.md (Pandoc Markdown output)

set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 input.tex"
  exit 1
fi

INPUT="$1"
BASENAME="${INPUT%.tex}"
TMPFILE="${BASENAME}.pandoc.tex"

# Remove problematic packages/environments (tikz, forest, beamer overlays/commands, columns blocks)
sed '/\\usepackage.*{tikz}/d' "$INPUT" | \
sed '/\\usetikzlibrary/d' | \
sed '/\\usepackage.*{forest}/d' | \
sed '/\\usepackage.*{beamer}/d' | \
sed '/\\usepackage.*{pgf}/d' | \
sed '/\\usepackage.*{pgfplots}/d' | \
sed '/\\usepackage.*{pgfplotstable}/d' | \
sed '/\\usepackage.*{pgfpages}/d' | \
sed '/\\usepackage.*{pgfplotstable}/d' | \
sed '/\\usepackage.*{binary-trees}/d' | \
sed '/\\begin{tikzpicture}/, /\\end{tikzpicture}/d' | \
sed '/\\begin{forest}/, /\\end{forest}/d' | \
sed '/\\begin{columns}/d' | \
sed '/\\end{columns}/d' | \
sed '/\\pause/d' | \
sed 's/\\documentclass.*{beamer}/\\documentclass{article}/g' | \
sed 's/\\input{[^}]*}//g' | \
sed 's/\\begin{center}//g' | \
sed 's/\\end{center}//g' | \
sed 's/\\column{[^}]*}//g' \
> "$TMPFILE.tmp"

perl -pe 's/\\onslide<[^>]+>{(.*?)}/\1/g' -i "$TMPFILE.tmp"
perl -pe 's/\\only<[^>]+>{(.*?)}/\1/g' -i "$TMPFILE.tmp"

# Use Perl to replace \begin{frame}[...]{...} with \subsection*{...}
# and remove \begin{frame}[...] with no title (no subsection)
perl -0777 -pe '
  # Replace \begin{frame}[optional]{title} with \subsection*{title}
  s{
    \\begin\{frame\}           # \begin{frame}
    (?:\[[^\]]*\])?            # Optional [fragile] or other options
    \{                         # Opening brace for title
    (                          # Capture group for title
      (?:                      # Non-capturing group
        [^{}]+                 # Non-brace characters
        |                      # OR
        \{[^{}]*\}             # Braces one level deep
      )*
    )
    \}                         # Closing brace for title
  }{\\subsection*{\1}}xg;

  # Remove \begin{frame} or \begin{frame}[...] with no title
  s/\\begin\{frame\}(?:\[[^\]]*\])?\s*//g;
' "$TMPFILE.tmp" > "$TMPFILE"

rm "$TMPFILE.tmp"

# Remove any remaining \end{frame}
sed -i '/\\end{frame}/d' "$TMPFILE"

# Remove <123> at the end of Beamer macro parameters, etc.
sed -i 's/<[0-9,+\-]*>//g' "$TMPFILE"

# Convert to GitHub Flavored Markdown (gfm) using Pandoc
pandoc.exe "$TMPFILE" -t gfm  -o "${BASENAME}.md"

# If successful, remove the intermediate file
if [ $? -eq 0 ]; then
  rm "$TMPFILE"
  
  # Replace lines ending with a single backslash with two spaces (Markdown line break)
  sed -i 's/\\[[:space:]]*$/  /' "${BASENAME}.md"

  echo "Conversion successful: ${BASENAME}.md created."
else
  echo "Pandoc conversion failed. Intermediate file kept: $TMPFILE"
  exit 2
fi