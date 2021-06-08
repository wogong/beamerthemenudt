.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: help bib clean pdfbiber pdfbibtex

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

bib:  ## Update bib file
	cp /home/wogong/Dropbox/Documents/Zotero/wogong.bib ./ref/

clean:
	rm -fv *.aux *.log *.toc *.ind *.gls *.glo *.idx *.ilg *.out *.bbl *.thm *.blg *.lot *.lof *.nls *.nlo *.bcf *.xml *.nav *.vrb *.snm

pdf: example-zh.tex
	xelatex example-zh.tex
