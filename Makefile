all:

install:
	./install.sh /usr $(DESTDIR)

clean:
	rm -f install.pl

distclean: clean
