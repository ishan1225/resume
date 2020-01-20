OUTPUT=build
SOURCES=resume.md $(wildcard tex/*)

FOOTER=--include-after-body=tex/footer.tex
HEADER=--from=markdown+yaml_metadata_block \
	--include-in-header=tex/options.sty \
	--include-before-body=tex/header.tex \
	--variable subparagraph=false

# Targets
$(OUTPUT)/resume.pdf: $(SOURCES)
	mkdir -p $(OUTPUT)
	pandoc $(HEADER) -o $(OUTPUT)/resume.pdf resume.md

$(OUTPUT)/resume.tex: $(SOURCES)
	mkdir -p $(OUTPUT)
	pandoc $(HEADER) -o $(OUTPUT)/resume.tex resume.md

$(OUTPUT)/resume.html: $(SOURCES)
	mkdir -p $(OUTPUT)
	pandoc -o $(OUTPUT)/resume.html resume.md

# Aliases
pdf: $(OUTPUT)/resume.pdf
tex: $(OUTPUT)/resume.tex
html: $(OUTPUT)/resume.html

clean:
	rm -rf $(OUTPUT)

.PHONY: clean pdf tex html
