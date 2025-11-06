# Directory where we want to place built PDFs
BUILD_DIR := ../docs/public/slides/
SRC_DIR := src

# Find all .tex files in SRC_DIR, strip directory and extension
TEX_FILES := $(basename $(notdir $(wildcard $(SRC_DIR)/*.tex)))

PDFS := $(addprefix $(BUILD_DIR)/,$(addsuffix .pdf,$(TEX_FILES)))

all: $(PDFS)

$(BUILD_DIR)/%.pdf: $(SRC_DIR)/%.tex $(SRC_DIR)/csu-theme.sty
# 	pdflatex.exe -halt-on-error -output-directory=objs -include-directory=./src $(<F)
	pdflatex.exe -halt-on-error -output-directory=objs -include-directory=./src $(<F)
	mv -f objs/$(@F) "$(BUILD_DIR)/$(@F)"
	SumatraPDF.exe $(BUILD_DIR)/$(@F) -view "single page" -reuse-instance  || true

# PHONY shortcut targets that depend on the corresponding PDF
$(TEX_FILES): %: $(BUILD_DIR)/%.pdf

clean:
	rm -rf objs
