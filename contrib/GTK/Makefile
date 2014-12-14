SUBDIRS := TEST
# SUBDIRS += TUTORIAL
# xxx To make TUTORIAL occurs following error.
# make[3]: Entering directory '/home/kiwamu/src/ATS-Postiats-contrib.masterq/contrib/GTK/TUTORIAL'
# "/home/kiwamu/src/ats-lang-anairiats-0.2.11"/bin/atsdoc --outcode chap_start_atxt.dats -i ATEXT/chap_start.atxt > chap_start_atxt.txt
# "/home/kiwamu/src/ats-lang-anairiats-0.2.11"/bin/atscc -D_ATS_GCATS -o chap_start.exe chap_start_atxt.dats -latsdoc
# /home/kiwamu/src/ats-lang-anairiats-0.2.11/bin/atsopt --output chap_start_atxt_dats.c --dynamic chap_start_atxt.dats
# /home/kiwamu/src/ATS-Postiats-contrib.masterq/contrib/GTK/TUTORIAL/chap_start_atxt.dats: 120(line=7, offs=10) -- 173(line=7, offs=63): error(1): the file [utils/atsdoc/DOCUMENT/TUTORIALATS/tutorialatxt.dats] is not available for inclusion
# exit(ATS): uncaught exception: ATS_2d0_2e2_2e11_2src_2ats_error_2esats__FatalErrorException(1027)
# Makefile:34: recipe for target 'chap_start.exe' failed
# make[3]: *** [chap_start.exe] Error 1

all regress cleanall:
	@for i in $(SUBDIRS); do \
		$(MAKE) -C $$i $@; \
	done
