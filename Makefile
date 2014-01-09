PREFIX=/usr
SEDPREFIX=$(subst /,\\/,$(PREFIX))

all:

install:
	install -d $(DESTDIR)$(PREFIX)/share/man/man1 $(DESTDIR)$(PREFIX)/share/cows $(DESTDIR)$(PREFIX)/bin
	install -m 644 cows/*.cow cows/mech-and-cow $(DESTDIR)$(PREFIX)/share/cows/
	sed -e "s/%PREFIX%/$(SEDPREFIX)/" cowsay.1 > $(DESTDIR)$(PREFIX)/share/man/man1/cowsay.1
	sed -e "s/%PREFIX%/$(SEDPREFIX)/" -e "s/%BANGPERL%/!\/usr\/bin\/perl/" cowsay > $(DESTDIR)$(PREFIX)/bin/cowsay
	chmod 755 $(DESTDIR)$(PREFIX)/bin/cowsay
	ln -srf $(DESTDIR)$(PREFIX)/share/man/man1/cowsay.1 $(DESTDIR)$(PREFIX)/share/man/man1/cowthink.1
	ln -srf $(DESTDIR)$(PREFIX)/bin/cowsay $(DESTDIR)$(PREFIX)/bin/cowthink

clean:
	rm -f install.pl

distclean: clean
