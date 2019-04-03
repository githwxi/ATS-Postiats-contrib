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
  -i ./libatscc2clj/libatscc2clj_all.clj
#
######
#
PATSCC=${PATSHOME}/bin/patscc
PATSOPT=${PATSHOME}/bin/patsopt
#
ATSCC2CLJ=${PATSHOME}/bin/atscc2clj
#
LIBATSCC2CLJ=$(PATSHOME)/contrib/libatscc2clj/ATS2-0.3.2
#
######
#
all:: \
GameOf24_clj_dats.clj
#
regress:: \
GameOf24_clj_dats.clj; $(CLOJURE2) $<
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
$(CPF) $(LIBATSCC2CLJ)/output/libatscc2clj_all.clj ./libatscc2clj/.
#
######
#
CPF=cp -rf
RMF=rm -f
RMRF=rm -rf
#
######

testall:: all
testall:: libatscc2clj
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) GameOf24_clj_dats.c

######
#
cleanall:: clean
cleanall:: ; $(RMF) GameOf24_clj_dats.clj
cleanall:: ; $(RMF) ./libatscc2clj/libatscc2clj_all.clj
#
# cleanall:: ; $(RMF) ./libatscc2clj/libatscc2clj_all.clj
#
###### end of [Makefile] ######
