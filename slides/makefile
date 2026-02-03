# Directory where we want to place built PDFs
BUILD_DIR := ../docs/public/slides
SRC_DIR := src

# Find all .tex files in SRC_DIR, strip directory and extension
TEX_FILES := $(basename $(notdir $(wildcard $(SRC_DIR)/*.tex)))

PDFS := $(addprefix $(BUILD_DIR)/,$(addsuffix .pdf,$(TEX_FILES)))

GNUPLOT ?= gnuplot
# GNU_PLOTS := $(wildcard objs/*-gnuplottex-*.gnuplot)
# REMOVE_GNUPLOT ?= true
# GNUPLOT_OPTS ?= -e "set terminal tikz"

.PHONY: clean all # gnuplot-figs

all: $(PDFS)

# gnuplot-figs:
# 	@set -e; \
# 	for f in $(GNU_PLOTS); do \
# 	  [ -e "$$f" ] || continue; \
# 	  echo "running gnuplot $$f"; \
# 	  $(GNUPLOT) $(GNUPLOT_OPTS) "$$f"; \
# 	done; \
# 	if [ "$(REMOVE_GNUPLOT)" = "true" ]; then \
# 	  for f in $(GNU_PLOTS); do rm -f "$$f"; done; \
# 	fi

$(BUILD_DIR)/%.pdf: $(SRC_DIR)/%.tex $(SRC_DIR)/csu-theme.sty $(SRC_DIR)/binary-trees.sty
	# Enable shell-escape so gnuplottex can execute gnuplot during compilation
	# pdflatex.exe -halt-on-error -shell-escape --enable-write18 -output-directory=objs -include-directory=./src $(<F) && \
	pdflatex.exe -halt-on-error -shell-escape --enable-write18 -output-directory=objs -include-directory=./src -include-directory=./ $(<F)
	mv -f objs/$(@F) "$(BUILD_DIR)/$(@F)"
	SumatraPDF.exe "$(BUILD_DIR)/$(@F)" -view "single page" -reuse-instance

# PHONY shortcut targets that depend on the corresponding PDF
$(TEX_FILES): %: $(BUILD_DIR)/%.pdf

clean:
	rm -rf objs

## Orchestration dependency run by the PDF rule: preplots-<name> calls the
## plots/<name> target so building a specific PDF triggers plot generation.
.PHONY: preplots-%
preplots-%:
	@found=0; \
	for f in plots/$*/*.plot; do \
	  [ -e "$$f" ] || continue; \
	  found=1; \
	  t="$${f%.plot}.tex"; \
	  echo "making $$t from $$f"; \
	  $(MAKE) --no-print-directory "$$t"; \
	done; \
	if [ $$found -eq 0 ]; then echo "No .plot files found in plots/$*"; fi

## Specific pattern for plots in subdirectories: only rebuild when
## the .plot is newer than the corresponding .tex.
%.tex: %.plot
	$(GNUPLOT) "$<"

