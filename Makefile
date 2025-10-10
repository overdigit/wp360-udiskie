prefix = /usr

all:

install:
	install -d $(DESTDIR)/etc
	install -d $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install -d $(DESTDIR)$(prefix)/lib/systemd/system
	install udiskie.yml $(DESTDIR)/etc
	install 50-udiskie.rules  $(DESTDIR)$(prefix)/share/polkit-1/rules.d
	install wp360-udiskie.service $(DESTDIR)$(prefix)/lib/systemd/system

.PHONY: all install
