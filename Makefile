############
## Project Arguments
############

NAME=year_of_meat_paper

############
## Latex Options
############

# LATEX_OPTS=-pdf -silent
# LATEX_OPTS=-pdf -bibtex
LATEX_OPTS=-pdf -bibtex -silent

############
## Commands
############

LATEX=latexmk $(LATEX_OPTS)

############
## Files
############

LATEX_PROJECT=$(NAME).tex
PDF_OUTPUT=$(NAME).pdf

############
## Rules
############

all: finish watch

finish: spell $(PDF_OUTPUT) count

$(PDF_OUTPUT): $(LATEX_PROJECT)
	$(LATEX) $(LATEX_PROJECT)

spell: $(LATEX_PROJECT)
	aspell -t -c $(LATEX_PROJECT)

count: $(LATEX_PROJECT)
	./texcount.pl $(LATEX_PROJECT)

watch: $(LATEX_PROJECT)
	$(LATEX) -pvc $(LATEX_PROJECT)

clean:
	$(LATEX) -c
