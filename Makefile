
.PHONY: all clean

all: piosenki.pdf

piosenki.pdf: *.uku header.groff
	groff -Tpdf -k -dpaper=a5 -P-pa5 -ms header.groff $(shell for x in *.uku; do echo $$x page.groff; done) > $@
  #              ^ unicode
  #                 ^^^^^^^^^^^^^^^^^ paper
  #

piosenki-a4.pdf: *.uku header.groff
	groff -Tpdf -k  -ms header.groff $(shell for x in *.uku; do echo $$x page.groff; done) > $@
clean:
	rm -f piosenki.pdf

# end
