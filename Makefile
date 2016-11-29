all: mwe1.pdf mwe2.pdf latex_bibs.pdf latex_bibs.html clean

mwe1.pdf: mwe1.tex
	latexmk -gg -xelatex mwe1.tex
	latexmk -c

mwe2.pdf: mwe2.tex
	latexmk -gg -xelatex mwe2.tex
	latexmk -c

latex_bibs.pdf: latex_bibs.Rmd
	Rscript -e 'rmarkdown::render("$(<F)", rmarkdown::beamer_presentation())'

latex_bibs.html: latex_bibs.Rmd
	Rscript -e 'rmarkdown::render("$(<F)", revealjs::revealjs_presentation())'

clean:
	latexmk -c
	rm mwe1.bbl mwe1.run.xml mwe2.bbl

.PHONY: all
