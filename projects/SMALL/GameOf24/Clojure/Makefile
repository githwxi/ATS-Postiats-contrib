#
# A simple Makefile
#

######
#
JAVA=java
#
CLOJURE=\
$(JAVA) -Xss4m \
  -cp /usr/share/java/clojure-1.4.jar
#
CLOJURE2=\
$(CLOJURE) clojure.main \
  -i $(LIBATSCC2CLJ)/libatscc2clj_all.clj
#
######
#
PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
#
ATSCC2CLJ=${PATSHOME}/bin/atscc2clj
#
LIBATSCC2CLJ=$(PATSHOME_contrib)/contrib/libatscc/libatscc2clj
#
######
#
all: \
GameOf24_clj_dats.clj ; $(CLOJURE2) $<
#
######
#
GameOf24_clj_dats.c: GameOf24_clj.dats; $(PATSOPT) -o $@ -d $<
#
GameOf24_clj_dats.clj: GameOf24_clj_dats.c; $(ATSCC2CLJ) -o $@ -i $<
#
######
#
libatscc2clj:: ; \
  $(CPRF) $(LIBATSCC2CLJ)/libatscc2clj_all.clj ./libatscc2clj/.
#
######

RMF=rm -f
RMRF=rm -rf

######

CPRF=cp -rf

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_clj_dats.c

######
#
cleanall:: clean
cleanall:: ; $(RMF) GameOf24_clj_dats.clj
#
# cleanall:: ; $(RMF) ./libatscc2clj/libatscc2clj_all.clj
#
###### end of [Makefile] ######
