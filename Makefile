# LaTeX Makefile
# Usage: make, make clean, make view

# Main document name (without .tex extension)
MAIN = main

# Output directory
OUTDIR = out

# LaTeX compiler
LATEX = pdflatex

# BibTeX compiler
BIBTEX = bibtex

# Viewer (adjust for your system)
VIEWER = open

# Final book name
BOOK = book.pdf

# Default target
all: $(OUTDIR)/$(MAIN).pdf

# Build and copy to root as book.pdf
book: $(OUTDIR)/$(MAIN).pdf
	cp $(OUTDIR)/$(MAIN).pdf $(BOOK)

# Create output directory
$(OUTDIR):
	mkdir -p $(OUTDIR)

# Compile the document
$(OUTDIR)/$(MAIN).pdf: $(MAIN).tex | $(OUTDIR)
	cd $(OUTDIR) && $(LATEX) -interaction=nonstopmode ../$(MAIN).tex
	cd $(OUTDIR) && $(BIBTEX) $(MAIN) || true
	cd $(OUTDIR) && $(LATEX) -interaction=nonstopmode ../$(MAIN).tex
	cd $(OUTDIR) && $(LATEX) -interaction=nonstopmode ../$(MAIN).tex

# Quick compile (single pass, no bibliography)
quick: $(MAIN).tex | $(OUTDIR)
	cd $(OUTDIR) && $(LATEX) -interaction=nonstopmode ../$(MAIN).tex

# View the PDF
view: $(OUTDIR)/$(MAIN).pdf
	$(VIEWER) $(OUTDIR)/$(MAIN).pdf

# Clean and compile in one command
fresh: clean | $(OUTDIR)
	cd $(OUTDIR) && $(LATEX) -interaction=nonstopmode ../$(MAIN).tex || true
	cd $(OUTDIR) && $(BIBTEX) $(MAIN) || true
	cd $(OUTDIR) && $(LATEX) -interaction=nonstopmode ../$(MAIN).tex || true
	cd $(OUTDIR) && $(LATEX) -interaction=nonstopmode ../$(MAIN).tex || true

# Clean auxiliary files
clean:
	rm -rf $(OUTDIR)

# Clean everything including PDF (same as clean for this setup)
distclean: clean

# Help
help:
	@echo "Available targets:"
	@echo "  all      - Compile the document (default)"
	@echo "  book     - Build and copy PDF to ./book.pdf"
	@echo "  quick    - Quick compile (single pass)"
	@echo "  fresh    - Clean and compile in one command"
	@echo "  view     - View the PDF"
	@echo "  clean    - Remove auxiliary files"
	@echo "  distclean- Remove all generated files"
	@echo "  help     - Show this help"

.PHONY: all book quick fresh view clean distclean help
