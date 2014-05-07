#
#
# This Makefile is automatically generated
# from executing the following command-line:
#
# make -f Makefile.gen
#
#

######

CC=gcc
CCOPT=$(CC) -std=c99 -D_GNU_SOURCE

######

PATSHOMEQ="$(PATSHOME)"
PATSHOMERELOCQ="$(PATSHOMERELOC)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt

######

CFLAGS += -I$(PATSHOMEQ)
CFLAGS += -I$(PATSHOMEQ)/ccomp/runtime
CFLAGS += -I$(PATSHOMERELOCQ)/contrib

######

all::

######

LNS=ln -s
RMF=rm -f

######

all:: test01
test01: test01_dats.c ; $(CCOPT) -DATS_MEMALLOC_LIBC $(CFLAGS) -o $@ $< -ljansson
cleanall:: ; $(RMF) test01

######

all:: test02
test02: test02_dats.c ; $(CCOPT) -DATS_MEMALLOC_LIBC $(CFLAGS) -o $@ $< -ljansson
cleanall:: ; $(RMF) test02

######

all:: \
github_commit_query
github_commit_query: \
github_commit_query_dats.c ; $(CCOPT) -DATS_MEMALLOC_LIBC $(CFLAGS) -o $@ $< -lcurl -ljansson
cleanall:: ; $(RMF) github_commit_query

######

%_dats.c: %.dats ; $(PATSOPT) -o $@ -d $<

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
