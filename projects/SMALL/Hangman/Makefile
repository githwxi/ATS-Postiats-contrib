#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
all:: \
hangman
#
regress:: \
hangman; ./hangman "camouflage"
#
hangman: \
hangman.dats; \
$(PATSCC2) -O2 \
  -DATS_MEMALLOC_LIBC -o $@ $< -L$(PATSLIB) -latslib
#
cleanall:: ; $(RMF) hangman
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.c
#
cleanall:: cleanats
#
###### end of [Makefile] ######
