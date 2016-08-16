#
# A Simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

MYTEXTING=./../.MYTEXT/bin/mytexting

######

CFLAGS += -O2

######

LDFLAGS :=
LDFLAGS += -lgc

######

MALLOCFLAG := -DATS_MEMALLOC_GCBDW

######

SOURCES_SATS += \
  lamcal.sats \

SOURCES_DATS += \
  mytest.dats \
  lamcal_tvar.dats \
  lamcal_tcst.dats \
  lamcal_term.dats \
  lamcal_aterm.dats \

######

MYTARGET=mytest

######
#
MYPORTDIR=MYPORTDIR
#
#MYPORTCPP=MYPORTCPP
#
######

include \
$(PATSHOME)/share/atsmake-post.mk

######
#
allpre:: \
lamcal_codegen.atxt; $(MYTEXTING) -o /dev/null -i $<
#
######
#
# allpre:: \
# lamcal_term.dats; \
# $(PATSOPT) -DATS CODEGEN2_FPRINT \
# --codegen-2 --output-a ./CODEGEN/lamcal_term_fprint.hats -d $<
# allpre:: \
# lamcal_aterm.dats; \
# $(PATSOPT) -DATS CODEGEN2_FPRINT \
# --codegen-2 --output-a ./CODEGEN/lamcal_aterm_fprint.hats -d $<
#
######
#
cleanall:: ; $(RMF) CODEGEN/lamcal_sats.hats
cleanall:: ; $(RMF) CODEGEN/lamcal_tvar_order.hats
cleanall:: ; $(RMF) CODEGEN/lamcal_tvar_funset.hats
cleanall:: ; $(RMF) CODEGEN/lamcal_term_fprint.hats
cleanall:: ; $(RMF) CODEGEN/lamcal_aterm_fprint.hats
#
######

testall:: all
testall:: regress
testall:: cleanall

######

regress:: mytest; ./mytest

######
#
cleanall:: ; $(RMF) $(MYPORTDIR)/*
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.o
cleanats:: ; $(RMF) $(MYPORTDIR)/*_?ats.c
#
######

###### end of [Makefile] ######
