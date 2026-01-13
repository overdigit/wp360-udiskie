prefix = /usr

all:

install:
	install -d $(DESTDIR)/etc
	install -d $(DESTDIR)/etc/wp360-udiskie/keyrings
	install -d $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install -d $(DESTDIR)$(prefix)/lib/systemd/system
	install -d $(DESTDIR)$(prefix)/share/wp360-udiskie/keyrings
	install -d $(DESTDIR)$(prefix)/bin
	install udiskie.yml $(DESTDIR)/etc
	install 50-udiskie.rules  $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install wp360-udiskie.service $(DESTDIR)$(prefix)/lib/systemd/system
	install -m 755 wp360-autoexec $(DESTDIR)$(prefix)/bin

.PHONY: all install
