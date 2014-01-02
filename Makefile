all:

install:
	./install.sh $(DESTDIR)/usr

clean:
	rm -f install.pl

distclean: clean
