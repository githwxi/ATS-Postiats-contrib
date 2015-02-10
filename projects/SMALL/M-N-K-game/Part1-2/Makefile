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

LDFLAGS :=
LDFLAGS += -lgc

######

MALLOCFLAG := -DATS_MEMALLOC_LIBC

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

######

MYTARGET=M-N-K-game

######
#
MYPORTDIR=MYPORTDIR
#
#MYPORTCPP=MYPORTCPP
#
######

include $(PATSHOME)/share/atsmake-post.mk

######

testall:: all
testall:: cleanall

######

cleanats:: ; $(RMF) *_?ats.c
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.o
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.c

######

cleanall:: ; $(RMF) $(MYPORTDIR)/*

######

###### end of [Makefile] ######
