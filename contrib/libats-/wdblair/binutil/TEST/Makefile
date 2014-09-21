

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

LDFLAGS :=
LDFLAGS += ../libpatsbinutil.so

######

all:: test0 hello.so

######

SOURCES_DATS += \
  test0.dats

######

MYTARGET=MYTARGET

######

DATSMEMALLOC=-DATS_MEMALLOC_LIBC

######

include $(PATSHOME)/share/atsmake-post.mk

######

OBJECTS := 
OBJECTS += $(MYTARGET_DATS_O)

######

hello.o: hello.c
	$(CC) -fPIC -o $@ -c $< $(CFLAGS)

hello.so: hello.o
	$(CC) -shared -o libhello.so hello.o

######

test0: $(OBJECTS); $(CC) -o $@ $^ $(LDFLAGS)

######

cleanall:: ; $(RMF) test0 hello.so hello.o
