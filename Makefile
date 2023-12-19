## This is the Makefile I used to compile consistenly the project, the main idea was to avoid
## doing latex biber latex
# Name of the main LaTeX file without the extension
MAIN=main

# The output PDF
PDF=$(MAIN).pdf
# The LaTeX compiler
LATEX=pdflatex
# The BibTeX compiler
BIBTEX=biber
# Dependencies of the main
DEPS := $(wildcard chapters/*.tex) \
		$(wildcard FrontPage/*.tex)
# Default target
all: $(PDF)

# Rule to make the PDF
$(PDF): $(MAIN).tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

# Clean up auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.toc $(MAIN).out $(MAIN).lof $(MAIN).lot

# Phony targets
.PHONY: all clean
