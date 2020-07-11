#
# A simple Makefile
#
#
include \
$(PATSHOME)/share/atsmake-pre.mk
#
GTKFLAGS=\
$(shell pkg-config gtk+-3.0 --cflags --libs)
#
include \
$(PATSHOME)/share/atsmake-post.mk
#
######
#
PATSCC2=$(PATSCC) $(INCLUDE)
#
INCLUDE+=-I$(PATSCONTRIB)/contrib
INCLUDE+=-I$(PATSHOME)/npm-utils/contrib/atscntrb
#
######
#
all:: \
QueenPuzzle_anim
QueenPuzzle_anim: \
  QueenPuzzle_anim.dats \
  ./../depth-first.dats \
  gtkcairotimer_toplevel.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^ $(GTKFLAGS) -lm -lrt
#
regress:: \
QueenPuzzle_anim; ./$<
cleanall:: ; $(RMF) QueenPuzzle_anim
#
all:: \
QueenPuzzle_anim2
QueenPuzzle_anim2: \
  QueenPuzzle_anim2.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^ $(GTKFLAGS) -lm -lrt
cleanall:: ; $(RMF) QueenPuzzle_anim2
#
regress:: \
QueenPuzzle_anim2; ./$<
cleanats:: ; $(RMF) *_?ats.c
#
testall:: all
testall:: regress
testall:: cleanall
#
###### end of [Makefile] ######
