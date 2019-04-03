#
# A Simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

export \
PATSCCOMP = $(CC) -D_XOPEN_SOURCE

######

CFLAGS += -O2

######

GTKCFLAGS=\
$(shell pkg-config gtk+-3.0 --cflags)

######

LDFLAGS :=
LDFLAGS += -lgc
LDFLAGS += $(shell pkg-config gtk+-3.0 --libs)

######

MALLOCFLAG := -DATS_MEMALLOC_GCBDW

######

SOURCES_SATS += \
  game.sats \

SOURCES_DATS += \
  game.dats \
  game_conf.dats \
  game_board.dats \
  game_initize.dats \
  game_mainloop.dats \
  game_finalize.dats \
  game_mylib.dats \
  game_gtkgui.dats \

######

MYTARGET=M-N-K-game

######
#
MYPORTDIR=MYPORTDIR
#
#MYPORTCPP=MYPORTCPP
#
######

ifdef \
MYCCRULE
else
game_gtkgui_dats.o: game_gtkgui.dats ; \
  $(PATSCC) -cleanaft $(INCLUDE) $(INCLUDE_ATS) $(MALLOCFLAG) $(CFLAGS) $(GTKCFLAGS) -c $<
endif

######


include \
$(PATSHOME)/share/atsmake-post.mk

######
#
PATSCC2=$(PATSCC) $(INCLUDE)
INCLUDE+=-IIATS $(PATSCONTRIB)/contrib
#
######

testall:: all
testall:: cleanall

######

cleanall:: ; $(RMF) $(MYPORTDIR)/*
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.o
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.c

######

###### end of [Makefile] ######
