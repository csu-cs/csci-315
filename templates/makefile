syllabus.html:
	pandoc --to=html --embed-resources --standalone --shift-heading-level-by=-1 --resource-path=../docs/ --template=./pandoc-template-csu.html --css=./pandoc-template-csu.css -fmarkdown-implicit_figures --metadata=hideheader ../docs/syllabus.md > ../syllabus.html

syllabus.tex: ../docs/syllabus.md
	pandoc ../docs/syllabus.md -f markdown+fenced_divs --lua-filter=append-schedule-dates.lua  --lua-filter=div-to-latex.lua --lua-filter=prepend-links.lua --lua-filter=remove-svg.lua --lua-filter=strip-attrs.lua --shift-heading-level-by=-1 --resource-path=../docs/ --template=pandoc-template-csu.tex -fmarkdown-implicit_figures --metadata=hideheader -V fontfamily=mathpazo -V fontsize=11pt -V geometry:margin=1in,letterpaper,portrait -V hideheader=yes -V colorlinks=yes -V subparagraph=yes -V urlcolor=blue!50!black -V web="csu-cs.github.io/csci-315/" -V logo=logo -o syllabus.tex


syllabus.pdf: syllabus.tex
	pdflatex -halt-on-error syllabus.tex
	pdflatex -halt-on-error syllabus.tex

	cmd /c "del /f /q syllabus.tex syllabus.aux syllabus.log syllabus.out syllabus.toc 2>nul"

	replace syllabus.pdf ..\docs\public\
