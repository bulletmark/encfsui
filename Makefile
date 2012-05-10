# Copyright (C) 2010 Mark Blakeney, markb@berlios.de. This program is
# distributed under the terms of the GNU General Public License.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any
# later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License at <http://www.gnu.org/licenses/> for more
# details.

ALLDIR=/usr/local

PRG = encfsui
APP = $(PRG).desktop

ALLPRG = $(ALLDIR)/bin
ALLAPP = $(ALLDIR)/share/applications

MYOPRG = $(HOME)/bin
MYAAPP = $(HOME)/.local/share/applications
MYBAPP = $(HOME)/Desktop

all:
	@echo "Type make install or make home"

install:
	test -d $(ALLPRG) && install -D $(PRG) $(ALLPRG)
	test -d $(ALLAPP) && install -D $(APP) $(ALLAPP)

uninstall:
	rm -f $(ALLPRG)/$(PRG)
	rm -f $(ALLAPP)/$(APP)

home:
	test -d $(MYOPRG) && install -D $(PRG) $(MYOPRG)
	if test -d $(MYAAPP); then install -D $(APP) $(MYAAPP); else \
	install -D $(APP) $(MYBAPP); fi
