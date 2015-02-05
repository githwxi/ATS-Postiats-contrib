#
# A simple Makefile
#

######

PATSCC=${PATSHOME}/bin/patscc

######

INCLATS += -I$(PATSHOMERELOC)/contrib

######

all::

######
#
all:: \
test
test: \
test.dats; \
$(PATSCC) $(INCLATS) -o $@ ./../DATS/sdstring.dats $<
regress: test; ./$<
cleanall:: ; $(RMF) test
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

######

###### end of [Makefile] ######