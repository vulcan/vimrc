
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = D:/Ruby192-mswin/include/ruby-1.9.1
hdrdir = D:/Ruby192-mswin/include/ruby-1.9.1
arch_hdrdir = D:/Ruby192-mswin/include/ruby-1.9.1/$(arch)
VPATH = $(srcdir);$(arch_hdrdir)/ruby;$(hdrdir)/ruby

DESTDIR = D:
prefix = $(DESTDIR)/Ruby192-mswin
exec_prefix = $(prefix)
rubylibprefix = $(prefix)/lib/$(RUBY_BASE_NAME)
bindir = $(exec_prefix)/bin
sbindir = $(exec_prefix)/sbin
libexecdir = $(exec_prefix)/libexec
datadir = $(prefix)/share
sysconfdir = $(prefix)/etc
sharedstatedir = $(DESTDIR)/etc
localstatedir = $(DESTDIR)/var
libdir = $(exec_prefix)/lib
includedir = $(prefix)/include
oldincludedir = $(DESTDIR)/usr/include
infodir = $(datadir)/info
mandir = $(datadir)/man
ridir = $(datadir)/ri
docdir = $(datadir)/doc/$(RUBY_BASE_NAME)
sitedir = $(rubylibprefix)/site_ruby
vendordir = $(rubylibprefix)/vendor_ruby
rubyhdrdir = $(includedir)/$(RUBY_BASE_NAME)-$(ruby_version)
sitehdrdir = $(rubyhdrdir)/site_ruby
vendorhdrdir = $(rubyhdrdir)/vendor_ruby
rubylibdir = $(rubylibprefix)/$(ruby_version)
archdir = $(rubylibdir)/$(arch)
sitelibdir = $(sitedir)/$(ruby_version)
sitearchdir = $(sitelibdir)/$(sitearch)
vendorlibdir = $(vendordir)/$(ruby_version)
vendorarchdir = $(vendorlibdir)/$(sitearch)

CC = cl -nologo
CXX = $(CC)
LIBRUBY = $(RUBY_SO_NAME).lib
LIBRUBY_A = $(RUBY_SO_NAME)-static.lib
LIBRUBYARG_SHARED = $(LIBRUBY)
LIBRUBYARG_STATIC = $(LIBRUBY_A)
OUTFLAG = -Fe
COUTFLAG = -Fo

RUBY_EXTCONF_H = 
cflags   = 
optflags = 
debugflags = 
warnflags = 
CFLAGS   =  -MD -Zi -W2 -O2b2xg- -G6 -Zm600 
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir)/ruby/backward -I$(hdrdir) -I$(srcdir)
DEFS     = 
CPPFLAGS = -DHAVE_FCNTL_H   
CXXFLAGS = $(CFLAGS) -MD -Zi -W2 -O2b2xg- -G6 -Zm600
ldflags  = -incremental:no -debug -opt:ref -opt:icf
dldflags = -incremental:no -debug -opt:ref -opt:icf -dll $(LIBPATH)
ARCH_FLAG = 
DLDFLAGS = $(ldflags) $(dldflags)
LDSHARED = cl -nologo -LD
LDSHAREDXX = $(LDSHARED)
AR = lib -nologo
EXEEXT = .exe

RUBY_BASE_NAME = ruby
RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = msvcrt-ruby191
arch = i386-mswin32
sitearch = i386-msvcrt
ruby_version = 1.9.1
ruby = D:/Ruby192-mswin/bin/ruby
RUBY = $(ruby:/=\)
RM = $(RUBY) -run -e rm -- -f
RM_RF = $(RUBY) -run -e rm -- -rf
RMDIRS = $(RUBY) -run -e rmdir -- -p
MAKEDIRS = @$(RUBY) -run -e mkdir -- -p
INSTALL = @$(RUBY) -run -e install -- -vp
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 0644
COPY = @$(RUBY) -run -e cp -- -v

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -libpath:. -libpath:$(libdir)
DEFFILE = $(TARGET)-$(arch).def

CLEANFILES = mkmf.log $(DEFFILE)
DISTCLEANFILES = vc*.pdb
DISTCLEANDIRS = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED)  oldnames.lib user32.lib advapi32.lib shell32.lib ws2_32.lib  
SRCS = ext.c match.c matcher.c watchman.c
OBJS = ext.obj match.obj matcher.obj watchman.obj
TARGET = ext
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR    = $(sitelibdir)$(target_prefix)
RUBYARCHDIR   = $(sitearchdir)$(target_prefix)
HDRDIR        = $(rubyhdrdir)/ruby$(target_prefix)
ARCHHDRDIR    = $(rubyhdrdir)/$(arch)/ruby$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so 
CLEANOBJS     = *.obj $(TARGET)-$(arch).exp $(TARGET)-$(arch).lib $(TARGET)-$(arch).pdb *.bak

all:    $(DLLIB)
static: $(STATIC_LIB)
.PHONY: all install static install-so install-rb
.PHONY: clean clean-so clean-rb

clean-rb-default::
clean-rb::
clean-so::
clean: clean-so clean-rb-default clean-rb
		@-$(RM) $(CLEANLIBS:/=\) $(CLEANOBJS:/=\) $(CLEANFILES:/=\)

distclean-rb-default::
distclean-rb::
distclean-so::
distclean: clean distclean-so distclean-rb-default distclean-rb
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES:/=\)
		@-$(RMDIRS) $(DISTCLEANDIRS:/=\)

realclean: distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	@-$(MAKEDIRS) $(@D:/=\)
	$(INSTALL_PROG) $(DLLIB:/=\) $(@D:/=\)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .obj

{$(hdrdir)}.cc.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(topdir)}.cc.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(srcdir)}.cc.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

.cc.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(hdrdir)}.cxx.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(topdir)}.cxx.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(srcdir)}.cxx.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

.cxx.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(hdrdir)}.cpp.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(topdir)}.cpp.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(srcdir)}.cpp.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

.cpp.obj:
	$(CXX) $(INCFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tp$(<:\=/)

{$(hdrdir)}.c.obj:
	$(CC) $(INCFLAGS) $(CFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tc$(<:\=/)

{$(topdir)}.c.obj:
	$(CC) $(INCFLAGS) $(CFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tc$(<:\=/)

{$(srcdir)}.c.obj:
	$(CC) $(INCFLAGS) $(CFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tc$(<:\=/)

.c.obj:
	$(CC) $(INCFLAGS) $(CFLAGS) $(CPPFLAGS) $(COUTFLAG)$(@) -c -Tc$(<:\=/)

$(DLLIB): $(DEFFILE) $(OBJS) Makefile
	@-$(RM) $(@:/=\)
	$(LDSHARED) -Fe$(@) $(OBJS) $(LIBS) $(LOCAL_LIBS) -link $(DLDFLAGS) -implib:$(*F:.so=)-$(arch).lib -pdb:$(*F:.so=)-$(arch).pdb -def:$(DEFFILE)



$(DEFFILE): 
	$(RUBY) -e "puts 'EXPORTS', 'Init_$(TARGET)'"  > $@

###
# Copyright 2010-2014 Greg Hurrell. All rights reserved.
# Licensed under the terms of the BSD 2-clause license.

#CFLAGS += -Wall -Wextra -Wno-unused-parameter
