prefix = /usr

all:

install:
	install -d $(DESTDIR)/etc
	install -d $(DESTDIR)/etc/wp360-udiskie/keyrings
	install -d $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install -d $(DESTDIR)$(prefix)/share/wp360-udiskie/keyrings
	install -d $(DESTDIR)$(prefix)/libexec/wp360-udiskie
	install udiskie.yml $(DESTDIR)/etc
	install 50-udiskie.rules  $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install -m 755 wp360-autoexec $(DESTDIR)$(prefix)/libexec/wp360-udiskie
	install overdigit.gpg $(DESTDIR)$(prefix)/share/wp360-udiskie/keyrings

.PHONY: all install
